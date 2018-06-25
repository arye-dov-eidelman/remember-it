class UserController < ApplicationController
  
  get "/account/signup" do
    erb :'users/signup'
  end
  
  get "/account/login" do
    # user.authenticate(password) # to sign_in
    erb :'users/login'
  end
  
  get "/signup" do
    redirect "account/signup"
  end

  get "/login" do
    redirect "account/login"
  end

end
