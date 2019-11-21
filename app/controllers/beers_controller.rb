class BeersController < ApplicationController
  get '/beers' do
    if logged_in?
      erb :'/beers/index', locals: { beers: Beer.all }
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
    def overall_rating(beer)
      if beer.opinions.blank?
        "Not Enough Raitings"
      else
        beer.opinions.average(:user_rating).to_f.round(1)
      end
    end
  end
end
