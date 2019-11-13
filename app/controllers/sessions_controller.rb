class SessionsController < ApplicationController
  get '/login' do
    if !logged_in?
      erb :'/sessions/login'
    else
      redirect '/leaderboard'
    end
  end

  post '/login' do
    login(params[:email], params[:password])
    flash[:success] = "Welcome, #{session[:email]}"
    redirect '/leaderboard'
  end

  get '/logout' do
    logout!
    redirect '/leaderboard'
  end
end
