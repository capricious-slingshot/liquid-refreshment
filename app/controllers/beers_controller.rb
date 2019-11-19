class BeersController < ApplicationController
  get '/beers' do
    if logged_in?
      erb :index
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
end
