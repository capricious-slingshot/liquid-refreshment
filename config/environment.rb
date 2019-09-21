ENV['SINATRA_ENV'] ||= "development"
require 'require_all'
require 'bundler/setup'
require 'active_record'
Bundler.require(:default, ENV['SINATRA_ENV'])

require_all 'app'
require_all 'lib'

ActiveRecord::Base.establish_connection("postgres://localhost/liquid_refreshment_development")
