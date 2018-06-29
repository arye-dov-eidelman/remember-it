class UserController < ApplicationController

  get "/account/signup" do
    session[:authenticate_referrer] = request.referrer
    @title = "Sign Up"
    erb :'users/signup'
  end

  post "/account/signup" do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      create_message("Welcome #{user.full_name}", "successful")
      redirect session[:sign_up_referrer]

    elsif User.find_by(email: params[:email])
      create_message("you already have an account. If you forgot your password, you can request a paasword reset", "notice")
      redirect "/account/login"

    else
      create_message("That's odd. We couldn't create your account.", "failure")
      redirect "/account/signup"
    end
  end
  
  get "/account/login" do
    session[:authenticate_referrer] = request.referrer
    @title = "Log In"
    erb :'users/login'
  end

  post "/account/login" do
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      create_message("Welcome #{user.full_name}", "successful")
      redirect session[:sign_up_referrer]

    elsif User.find_by(email: params[:email])
      create_message("you already have an account. If you forgot your password, you can request a paasword reset (perhaps somtime in he futre this will work)", "notice")
      redirect "/account/login"
      
    else
      create_message("thats not your password, try again", "failure")
      redirect "/account/login"
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
  

  ### redirects ###
  get "/signup" do
    redirect "account/signup"
  end

  get "/login" do
    redirect "account/login"
  end

end
