class UsersController < ApplicationController
  get '/settings' do
    if logged_in?
      erb :'/users/edit'
    else
       redirect '/'
    end
  end

  get '/:slug/beers' do
    erb :'/users/index', locals: { user: User.find_by_slug(params[:slug]) }
  end

  get '/signup' do
    if logged_in?
      user = User.find_by(id: session[:user_id])
      redirect "/#{user.slug}/beers"
    else
      erb :'/sessions/signup'
    end
  end

  post '/signup' do
    user = User.new(params)
    if user.valid? && user.errors.empty?
      user.save
      login(params[:user_id], params[:password])
      flash[:success] = "Welcome, #{user.username.capitalize}! \n Let's drink some Beer!"
      redirect "/#{user.slug}/beers"
    else
      flash[:error] = user.errors.full_messages
      redirect '/signup'
    end
  end
end
