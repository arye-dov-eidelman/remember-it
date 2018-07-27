class LearnController < ApplicationController
  # the learn controllers have not been implemented

  get "/learn*" do
    erb :'coming-soon'
  end


  ## redirects ##

  get "/l/*" do
    redirect "/learn/#{params[:splat]}"    
  end

end
