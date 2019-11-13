require './config/environment'

# set :database, "postgres://localhost/liquid_refreshment_development"

use Rack::MethodOverride

use BeersController
use UsersController
use SessionsController
run ApplicationController
