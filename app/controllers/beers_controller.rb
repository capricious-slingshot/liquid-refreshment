class BeersController < ApplicationController
  get '/beers' do
    if logged_in?
      erb :'/beers/index', locals: { beers: Beer.all }
    else
      redirect '/login'
    end
  end

  get '/beers/:id' do
    beer = Beer.find_by(id: params[:id])
    user = User.find_by(id: session[:user_id])
    review = user && user.opinions.find_by(beer_id: beer.id)
    erb :'/beers/show', locals: {review: review, beer: beer}
  end

  delete '/beers/:id/delete' do
    beer = Beer.find_by(id: params[:id])

    if logged_in? && owner?(beer)

      if beer.delete && beer.errors.empty?
        flash[:success] = "Scuccessfully Deleted #{beer.name.capitalize}"
        redirect '/beers'
      else
        flash[:error] = ["Something went wrong"] << user.errors.full_messages
        redirect "/beers/#{params[:id]}"
      end
    end

  end

  helpers do
    def overall_rating(beer)
      if beer.opinions.blank?
        "Not Enough Raitings"
      else
        beer.opinions.average(:user_rating).to_f.round(1)
      end
    end

    def owner?(beer)
      session[:user_id] == beer.created_by
    end
  end
end
