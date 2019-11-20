class BeersController < ApplicationController
  get '/beers' do
    if logged_in?
      erb :'/beers/index', locals: { beers: Beer.all }
    else
      redirect '/login'
    end
  end

  get '/beers/:id/edit' do
    if logged_in?
      erb :'/beers/edit', locals: { beers: Beer.all }
    else
      redirect '/login'
    end
  end

  get '/beers/:slug' do
    if logged_in?
      user = User.find_by_slug(params[:slug])
      erb :'users/index', locals: {user: user}
    else
      redirect '/login'
    end
  end

  helpers do
    def overall_rating
      #if rating is <= 1 "Not Enough Raitings"
      3
    end
  end
end
