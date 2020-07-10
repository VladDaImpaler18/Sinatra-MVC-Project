require './config/environment'

if ActiveRecord::Migrator.needs_migration?
   raise 'Migrations are pending. Run `rake db:migrate` to resolve this'
end

use Rack::MethodOverride

#use otherController

run ApplicationController
