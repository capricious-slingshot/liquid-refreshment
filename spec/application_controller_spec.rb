require 'spec_helper'
require_relative '../config/environment'

describe ApplicationController do

  describe "Index" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Cloudburst Brewing")
      expect(last_response.body).to include("Login")
      expect(last_response.body).to include("Signup")
    end

    it 'shows Leaderboard / My Beers navigation only when logged in' do
      user1 = User.create(name: "Scooby Doo", email: "ruuuf@dog.com", password: "isniffbutts")

      get '/'
      expect(last_response.status).to eq(200)

      expect(last_response.body).to include("Cloudburst Brewing")
      expect(last_response.body).to include("My Ratings")
      expect(last_response.body).to include("Leaderboard")
    end
  end

  describe "Create User" do
    it 'Can create a new user' do
      params = {
        :username => "skittles123",
        :email => "skittles@aol.com",
        :password => "rainbows"
      }
      get '/signup'
      expect(last_response.status).to eq(200)
      post '/signup', params
      expect(last_response.location).to include("/#{params[:username]}/beers")
    end

    it 'cannot create a new user if logged in' do
      get '/signup'
      expect(last_response.body).to_not include("Log In")
      expect(last_response.location).to include("/#{params[:username]}/beers")
    end
  end

end
