class AccountController < ApplicationController

  get "/account/signup" do
    session[:authenticate_referrer] = request.referrer
    @title = "Sign up"
    erb :'account/signup'
  end

  post "/account/signup" do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      create_message("Welcome #{user.full_name}", "successful")
      redirect session[:sign_up_referrer]

    elsif User.find_by(email: params[:email])
      create_message("You already have an account. If you forgot your password, you can request a password reset. (perhaps sometime in the future this will actually work.)", "notice")
      redirect "/account/login"

    else
      create_message("That's odd. We couldn't create your account.", "failure")
      redirect "/account/signup"
    end
  end
  
  get "/account/login" do
    session[:authenticate_referrer] = request.referrer
    @title = "Log in"
    erb :'account/login'
  end

  post "/account/login" do
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        create_message("Welcome #{user.full_name}.", "successful")
        redirect session[:sign_up_referrer]

      else
        create_message("Thats not your password, try again.", "failure")
        redirect "/account/login"
      end
    else
      create_message("This account does not exist! enter the correct email or sign up.", "failure")
      redirect "/account/login"
    end
  end

  get '/account/logout' do
    session.clear
    create_message("You've successfully logged out.", "successful")
    redirect '/'
  end

  get "/account/settings" do
    erb :'/account/settings'
  end

  patch "/account" do
    if @user.authenticate(params[:user][:password])
      if !@user.update(params[:user])
        create_message("We couldn't update your account", "failure")
      else
        create_message("You've successfully updated your account details", "successful")
      end
    else
      create_message("Thats not your password, try again", "failure")
    end
    erb :'/account/settings'
  end
  

  ### redirects ###
  get "/signup" do
    redirect "account/signup"
  end

  get "/login" do
    redirect "account/login"
  end

  get "/account" do
    redirect "account/settings"
  end

end