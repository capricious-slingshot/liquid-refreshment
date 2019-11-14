require 'active_record'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::ActiveRecordExtension
    enable :sessions
    register Sinatra::Flash
    set :session_secret, 'dummySessionSecret'
  end

  get '/' do
    erb :index
  end

  get '/login' do
    if !logged_in?
      erb :'/sessions/login'
    else
      redirect '/leaderboard'
    end
  end

  post '/login' do
    login(params[:user_id], params[:password])
    user = User.find_by(email: params[:user_id])
    flash[:success] = "Let's drink some beer, #{user.username.capitalize}!"
    redirect "/#{user.slug}/beers"
  end

  get '/logout' do
    logout!
    redirect '/leaderboard'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def login(email, password)
      user  = User.find_by(email: email)
      if user && user.authenticate(password)
        session[:user_id] = user.id
      else
        flash[:error] = ["Invalid Credientals"]
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end
  end

end
