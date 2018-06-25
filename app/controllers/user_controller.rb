class UserController < ApplicationController

  get "/account/login" do
    erb :'users/login'
  end

  # user.authenticate(password) # to sign_in
  
  get "/account/signup" do
    erb :'users/signup'
  end

end
