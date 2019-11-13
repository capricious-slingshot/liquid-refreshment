class SessionsController < ApplicationController
  get '/login' do
    if !logged_in
      erb :'users/index.erb'
    else
      redirect '/'
    end
  end

  get '/logout' do
    logout!
    redirect '/'
  end
end
