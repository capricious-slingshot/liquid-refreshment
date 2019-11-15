require 'spec_helper'
require 'rspec'
require 'rack/test'
require_relative '../config/environment'

describe ApplicationController do

  describe "Index" do

    it 'loads the homepage and does not show My Beers navigation if not logged in' do
      get '/'
      expect(last_response.status).to eq(200)

      expect(last_response.body).to include("Log In")
      expect(last_response.body).to include("Signup")
      expect(last_response.body).to_not include("My Beers")
      expect(last_response.body).to include("Cloudburst Brewing")
    end
  end

  describe "Create User" do
    before(:each) do
      params = {username: "skittles123", email: "skittles@aol.com", password: "rainbows"}
      get '/signup'
      expect(last_response.status).to eq(200)
      post '/signup', params
    end
    params = {username: "skittles123", email: "skittles@aol.com", password: "rainbows"}

    it 'Can create a new user' do
      expect(last_response.location).to include("/#{params[:username]}/beers")
    end

    it 'cannot create a new user if logged in' do
      login()
      expect(last_response.body).to_not include("Log In")
      expect(last_response.location).to include("/#{params[:username]}/beers")
    end

    it 'cannot create a new user with an exzisting username' do
      get '/signup'
      expect(last_response.status).to eq(200)

      post '/signup', params
    end

    it 'cannot create a new user with a string that is not an email' do
      get '/signup'
      expect(last_response.status).to eq(200)

      post '/signup', params
    end

    it 'cannot create a new user with an exzisting email' do
      get '/signup'
      expect(last_response.status).to eq(200)

      post '/signup', params
    end

    it 'cannot create a new user with apassword shorter than 8 characters' do
      get '/signup'
      expect(last_response.status).to eq(200)

      post '/signup', params
    end

  end

end
