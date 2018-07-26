class LearnController < ApplicationController
  # the learn controllers have not been implemented

  get "/learn" do
    'comming (not so) soon'
  end

  get "/learn/:track" do
    'track'
  end

  get "/learn/:track/:chapter" do
    'chapter'
  end

  get "/learn/:track/:chapter/:quiz" do
    'quiz'
  end
  
  ## redirects ##

  get "/l/*" do
    redirect "/learn/#{params[:splat]}"    
  end

end
