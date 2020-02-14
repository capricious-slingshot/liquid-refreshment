class BeersController < ApplicationController

  get '/beers' do
    logged_in? ? (erb :'/beers/index', locals: { beers: Beer.all }) : access_denied
  end

  get '/beers/new' do
    logged_in? ? (erb :'/beers/new') : access_denied
  end

  post '/beers' do
    user = User.find_by(id: session[:user_id])
    #needs fuzzy search enhancement
    beer = Beer.find_by(name: params[:name]) || Beer.find_by(description: params[:description])

    if !beer.nil?
      flash[:error] = ["Beer Already Exzists"]
      redirect "/beers/#{beer.slug}"
    else
      beer = Beer.new(name: params[:name],
                      description: params[:description],
                      created_by: user.id
                     )
      if beer.valid? && beer.errors.empty?
        beer.save
        flash[:success] = "Successfully Created '#{beer.name}'"
        redirect "/beers/#{beer.slug}"
      else
        flash[:error] = beer.errors.full_messages
        redirect '/beers/new'
      end
    end
  end

  get '/beers/:slug' do
    beer = Beer.find_by_slug(params[:slug])
    if logged_in?
      user = User.find_by(id: session[:user_id])
      review = user && user.opinions.find_by(beer_id: beer.id)
      erb :'/beers/show', locals: {review: review, beer: beer}
    else
      access_denied
    end
  end

  post '/beers/:slug' do
    beer = Beer.find_by_slug(params[:slug])
    rating = Opinion.new(user_id: session[:user_id],
                beer_id: beer.id,
                user_rating: params[:user_rating],
                tasting_notes: params[:tasting_notes]
                )
    if rating.valid? && rating.errors.empty?
      rating.save
      flash[:success] = "Successfully Updated Rating"
    else
      flash[:error] = rating.errors.full_messages
    end
    redirect "/beers/#{params[:slug]}"
  end

  get '/beers/:slug/edit' do
    beer = Beer.find_by_slug(params[:slug])
    opinion = beer.opinions.find_by(user_id: session[:user_id])

    if logged_in?
      erb :'/beers/edit', locals: { beer: beer, opinion: opinion }
    else
      access_denied
    end
  end

  patch '/beers/:slug/edit' do
    beer = Beer.find_by_slug(params[:slug])
    opinion = beer.opinions.find_by(user_id: session[:user_id])
    if logged_in?
      beer.name = params[:name]
      beer.description = params[:description]

      opinion.update(user_rating: params[:user_rating], tasting_notes: params[:tasting_notes]) if opinion

      if beer.save && beer.errors.empty?
        flash[:success] = "Successfully Updated '#{beer.name}'"
        redirect "/beers/#{beer.slug}"
      else
        flash[:error] = beer.errors.full_messages
        redirect "/beers/#{beer.slug}/edit"
      end
    else
      access_denied
    end
  end

  delete '/beers/:slug/delete' do
    beer = Beer.find_by_slug(params[:slug])

    if logged_in?
      if beer.delete && beer.errors.empty?
        flash[:success] = "Successfully Deleted #{beer.name.capitalize}"
        redirect '/beers'
      else
        flash[:error] = beer.errors.full_messages
        redirect "/beers/#{beer.slug}"
      end
    else
      access_denied
    end
  end

  delete '/beers/:slug/remove-review' do
    beer = Beer.find_by_slug(params[:slug])
    opinion = Opinion.find_by(user_id: session[:user_id], beer_id: beer.id)

    if logged_in?
      if opinion.delete && opinion.errors.empty?
        flash[:success] = "Successfully Removed Review"
      else
        flash[:error] = opinion.errors.full_messages
      end
      redirect "/beers/#{beer.slug}"
    else
      access_denied
    end
  end
end
