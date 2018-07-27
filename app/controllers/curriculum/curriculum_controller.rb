class CurriculumController < ApplicationController

  before do
    # redirect logged out users
    if !@logged_in
      create_message("You need to be logged in to view that page.", "notice")
      redirect '/account/login'
    end
  end

  # display all the tracks the user owns
  # ideally @users_tracks should be set here
  get "/curriculum" do 
    @title = "Curriculum"
    erb :'curriculum/index'
  end
end
