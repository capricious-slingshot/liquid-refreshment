class BeersController < ApplicationController
  get '/beers' do
    if logged_in?
      erb :'/beers/index', locals: { beers: Beer.all }
    else
      access_denied
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

    if logged_in?
      erb :'/beers/edit', locals: { beer: beer }
    else
      access_denied
    end
  end

  patch '/beers/:id/edit' do
    beer = Beer.find_by(id: params[:id])
    if logged_in?
      beer.name = params[:name]
      beer.description = params[:description]
      if beer.save && beer.errors.empty?
        flash[:success] = "Scuccessfully Updated #{beer.name.capitalize}"
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
    def overall_rating(beer)
      if beer.opinions.blank?
        "Not Enough Raitings"
      else
        beer.opinions.average(:user_rating).to_f.round(1)
      end
    end

    def owner?(beer)
      session[:user_id] == beer.created_by
    end
  end
end
