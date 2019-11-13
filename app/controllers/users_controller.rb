class UsersController < ApplicationController
  get '/settings' do
    erb :'/users/edit'
  end

  get '/:slug/beers' do
    erb :'/users/index', locals: { user: User.find_by_slug(params[:slug]) }
  end

  get '/signup' do
    if logged_in?
      user = User.find_by(email: session[:email])
      redirect "/#{user.slug}/beers"
    else
      erb :'/sessions/signup'
    end
  end

  post '/signup' do
    user = User.new(params)
    if user.valid? && user.errors.empty?
      user.save
      login(params[:email], params[:password])
      flash[:success] = "Welcome, #{user.username.capitalize}! \n Let's drink some Beer!"
      redirect "/#{user.slug}/beers"
    else
      flash[:error] = user.errors.full_messages
      redirect '/signup'
    end
  end
end
