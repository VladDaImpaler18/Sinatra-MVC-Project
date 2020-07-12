require './config/environment'

use Rack::MethodOverride

#use otherController
use OwnersController
use PetsController
use PicturesController

run ApplicationController
