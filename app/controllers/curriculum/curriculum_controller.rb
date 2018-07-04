class CurriculumController < ApplicationController

  get "/curriculum" do 
    if !(@user = User.find_by(id: session[:user_id]))
      create_message("You need to be logged in to view that page.", "notice")
      redirect '/account/login'
    end

    @title = "Curriculum"
    erb :'curriculum/index'
  end
end
