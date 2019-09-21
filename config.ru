require './config/environment'

set :database, "postgres://localhost/liquid_refreshment_development"

use Rack::MethodOverride
run ApplicationController
