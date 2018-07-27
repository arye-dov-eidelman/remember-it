require './config/environment'
require './app/helpers/messageable'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ibabrybsuhfh"
  end

  helpers Messageable

  before do
    # if the user is logged in get their info and set @logged_in to true
    if session[:user_id]
      if user = User.find_by(id: session[:user_id])
        @user = user
        @logged_in = true
      end
    end
  end

  # home page
  get "/" do
    erb :index
  end

  # 404 page
  error 404 do
    erb :'404'
  end

  # 403 page
  error 403 do
    erb :'403'
  end

end
