ENV['SINATRA_ENV'] ||= "development"

require 'require_all'
require 'bundler/setup'
require 'active_record'

Bundler.require(:default, ENV['SINATRA_ENV'])
require './app/controllers/application_controller'


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
