class UsersController < ApplicationController

  get '/users/:slug/beers' do
    if logged_in?
      user = User.find_by_slug(params[:slug])
      erb :'users/index', locals: {user: user}
    else
      redirect '/login'
    end
  end

  get '/users/:slug/settings' do
    if logged_in? && user = User.find_by(id: session[:user_id])
      erb :'/users/edit', locals: {user: user}
    else
      flash[:error] = ["Access Denied"]
      redirect "/login"
    end
  end

  patch '/users/:slug/settings/edit' do
    user = User.find_by(id: session[:user_id])
    valid_password = user.authenticate(params[:current_password])
    if !valid_password
      flash[:error] = ["Invalid Password"]
      redirect "/users/#{user.slug}/settings"
    elsif user.id == session[:user_id] && valid_password

      user.username = params[:username]
      user.email = params[:email]
      user.password = params[:new_password]

      if user.valid? && user.errors.empty?
        user.save
        flash[:success] = "#{user.slug} Scuccessfully Updated"
        redirect "/users/#{user.slug}/beers"
      else
        flash[:error] = user.errors.full_messages
        redirect "/users/#{user.slug}/settings"
      end

    else
      flash[:error] = ["Access Denied"]
      redirect "/login"
    end
  end
end
