class BeersController < ApplicationController

  get '/beers' do
    if logged_in?
      erb :'/beers/index', locals: { beers: Beer.all }
    else
      access_denied
    end
  end

  get '/beers/new' do
    if logged_in?
      erb :'/beers/new'
    else
      access_denied
    end
  end

  post '/beers' do
    user = User.find_by(id: session[:user_id])

    #needs fuzzy search enhancement
    beer = Beer.find_by(name: params[:name]) || Beer.find_by(name: params[:description])

    if !beer.nil?
      flash[:error] = ["Beer Already Exzists"]
      redirect '/beers/new'
    else
      beer = Beer.new(name: params[:name],
                      description: params[:description],
                      created_by: user.id
                     )
      if beer.valid? && beer.errors.empty?
        beer.save
        flash[:success] = "Successfully Created '#{beer.name}'"
        redirect "/users/#{user.slug}/beers"
      else
        flash[:error] = user.errors.full_messages
        redirect '/beers/new'
      end
    end
  end



  get '/beers/:id' do
    beer = Beer.find_by(id: params[:id])
    if logged_in?
      user = User.find_by(id: session[:user_id])
      review = user && user.opinions.find_by(beer_id: beer.id)
      erb :'/beers/show', locals: {review: review, beer: beer}
    else
      access_denied
    end
  end

  get '/beers/:id/edit' do
    beer = Beer.find_by(id: params[:id])
    opinion = beer.opinions.find_by(user_id: session[:user_id])

    if logged_in?
      erb :'/beers/edit', locals: { beer: beer, opinion: opinion }
    else
      access_denied
    end
  end

  patch '/beers/:id/edit' do
    beer = Beer.find_by(id: params[:id])
    opinion = beer.opinions.find_by(user_id: session[:user_id])
    if logged_in?
      beer.name = params[:name]
      beer.description = params[:description]

      opinion.update(user_rating: params[:user_rating], tasting_notes:params[:tasting_notes]) if opinion

      if beer.save && beer.errors.empty?
        flash[:success] = "Scuccessfully Updated '#{beer.name}'"
        redirect "/beers/#{beer.id}"
      else
        flash[:error] = beer.errors.full_messages
        redirect "/beers/#{beer.id}/edit"
      end
    else
      access_denied
    end
  end

  delete '/beers/:id/delete' do
    beer = Beer.find_by(id: params[:id])

    if logged_in? && owner?(beer)
      if beer.delete && beer.errors.empty?
        flash[:success] = "Successfully Deleted #{beer.name.capitalize}"
        redirect '/beers'
      else
        flash[:error] = user.errors.full_messages
        redirect "/beers/#{params[:id]}"
      end
    else
      access_denied
    end
  end

  helpers do

    def owner?(beer)
      session[:user_id] == beer.created_by
    end

  end
end
