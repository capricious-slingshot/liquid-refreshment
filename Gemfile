source "https://rubygems.org"

ruby "2.6.1"
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "sinatra", '2.0.7'
gem 'activerecord', '4.2.7.1', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake', '13.0.1'
gem 'require_all', '3.0.0'
gem 'bcrypt', '3.1.13'
gem 'sinatra-flash', '0.3.0'


group :production do
  #required to push to heroku
  gem "sequel", '5.26.0'
  gem "pg", '1.1.4'
end

group :development do
  gem 'shotgun', '0.9.2'
  gem 'pry', '0.12.2'
  gem 'tux', '0.3.0'
  gem 'sqlite3', '1.3.11'
  gem "rspec", '3.9.0'
end

group :test do
  gem "rspec", '3.9.0'
  gem "capybara", '3.29.0'
  gem 'rack-test'
  gem 'database_cleaner'
  gem 'pry', '0.12.2'
end
