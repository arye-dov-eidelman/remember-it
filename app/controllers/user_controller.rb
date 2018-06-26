class UserController < ApplicationController

  get "/account/signup" do
    session[:authenticate_referrer] = request.referrer
    erb :'users/signup'
  end

  post "/account/signup" do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      create_message("welcome #{user.full_name}", "great")
      binding.pry
      redirect session[:sign_up_referrer]

    elsif User.find_by(email: params[:email])
      create_message("you already have an account. If you forgot it you can request a paasword reset", "notice")
      redirect "/account/login"
    else
      
      create_message("That's odd. We couldn't create your account.", "error")
      redirect "/account/signup"
    end
    binding.pry
  end
  
  get "/account/login" do
    session[:authenticate_referrer] = request.referrer
    # user.authenticate(password) # to sign_in
    erb :'users/login'
  end
  

  ### redirects ###
  get "/signup" do
    redirect "account/signup"
  end

  get "/login" do
    redirect "account/login"
  end

end
