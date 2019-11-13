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
end
