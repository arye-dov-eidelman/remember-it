class LearnController < ApplicationController

  get "/learn" do
    'tracks'
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
