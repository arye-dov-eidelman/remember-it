ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# connect to sqlite in developmet or test envirments
# connect to postgress in production envirment
if ENV['SINATRA_ENV'] == "development" || ENV['SINATRA_ENV'] == "test"
  ActiveRecord::Base.establish_connection( 
    :adapter => "sqlite3", 
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite" 
    )
  else
  set :database_file, 'database.yml' 
end

# require the conntrollers in the correct order
# so controolers won't inherit from controlers that were not yet loaded
require_relative '../app/controllers/application_controller.rb'
require_relative '../app/controllers/curriculum/curriculum_controller.rb'

require_all 'app'
