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

  helpers do
    def logged_in?
      !!session[:email]
    end

    def login(email, password)
      user  = User.find_by(email: email)
      if user && user.authenticate(password)
        session[:email] = user.email
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
