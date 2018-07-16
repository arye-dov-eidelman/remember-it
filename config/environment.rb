ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

set :database_file, 'database.yml'

require_relative '../app/controllers/application_controller.rb'
require_relative '../app/controllers/curriculum/curriculum_controller.rb'

require_all 'app'
