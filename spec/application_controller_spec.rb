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
      @params = {username: "skittles123", email: "skittles@aol.com", password: "rainbows"}
      get '/signup'
      expect(last_response.status).to eq(200)
      post '/signup', @params
    end

    after(:each) do
      puts last_response.body
      # get '/logout'
      # binding.pry
      # User.find_by(username: @params[:username]).delete
    end

    it 'Can create a new user' do
      post '/signup', @params
      expect(last_response.location).to include("/#{@params[:username]}/beers")
      expect(last_response.body).to include("Welcome, #{@params[:username]} Let's drink some Beer!")
    end

    it 'cannot create a new user if logged in' do
      get '/login'
      post '/login', @params
      expect(last_response.body).to_not include("Log In")
      expect(last_response.location).to include("/#{@params[:username]}/beers")
    end

    it 'cannot create a new user with an exzisting username' do
      get '/signup'
      expect(last_response.status).to eq(302)

      params = {username: "skittles123", email: "test@aol.com", password: "11111111"}
      post '/signup', params
      expect(last_response.body).to include("Username has already been taken")
    end

    it 'cannot create a new user with an exzisting email' do
      get '/signup'
      expect(last_response.status).to eq(200)

      params = {username: "test123", email: "skittles@aol.com", password: "rainbows"}
      post '/signup', params
      expect(last_response.body).to include("Email has already been taken")
    end

    it 'cannot create a new user with a string that is not an email' do
      get '/signup'
      expect(last_response.status).to eq(200)

      params = {username: "test123", email: "lovely string", password: "rainbows"}
      post '/signup', params
      expect(last_response.body).to include("Email is not an email")
    end

    it 'cannot create a new user with password shorter than 8 characters' do
      get '/signup'
      expect(last_response.status).to eq(200)


      params = {username: "test1232", email: "skittles5@aol.com", password: "rain"}
      post '/signup', params
      expect(last_response.body).to include("Password is too short (minimum is 8 characters)")
    end

  end

end
