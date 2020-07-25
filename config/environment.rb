
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require "dotenv"
Dotenv.load('./config/settings.env')

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
require './app/controllers/application_controller'
require 'random_word_generator'
require_relative './admincreator'

require_all 'app'