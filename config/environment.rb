ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

if ENV['SINATRA_ENV'] == "development" || ENV['SINATRA_ENV'] == "test"
  ActiveRecord::Base.establish_connection( 
    :adapter => "sqlite3", 
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite" 
  )
else
  set :database_file, 'database.yml' 
end

require_relative '../app/controllers/application_controller.rb'
require_relative '../app/controllers/curriculum/curriculum_controller.rb'

require_all 'app'
