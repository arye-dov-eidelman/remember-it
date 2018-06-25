class UserController < ApplicationController

  get "/account/login" do
    erb :'users/login'
  end
  
  get "/account/signup" do
    erb :'users/signup'
  end

end
