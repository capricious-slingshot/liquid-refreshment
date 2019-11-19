class UsersController < ApplicationController

  get '/settings' do
    if logged_in? && user = User.find_by(id: session[:user_id])
      erb :'/users/edit', locals: {user: user}
    else
      flash[:error] = ["Access Denied"]
      redirect "/login"
    end
  end

  patch '/settings/edit' do
    user = User.find_by(id: session[:user_id])
    valid_password = user.authenticate(params[:current_password])
    if !valid_password
      flash[:error] = ["Invalid Password"]
      redirect "/settings"
    elsif user.id == session[:user_id] && valid_password

      user.username = params[:username]
      user.email = params[:email]
      user.password = params[:new_password]

      if user.valid? && user.errors.empty?
        user.save
        flash[:success] = "#{user.slug} Scuccessfully Updated"
        redirect "/beers/#{user.slug}"
      else
        flash[:error] = user.errors.full_messages
        redirect '/settings'
      end

    else
      flash[:error] = ["Access Denied"]
      redirect "/login"
    end
  end
end
