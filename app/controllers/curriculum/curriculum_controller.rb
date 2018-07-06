class CurriculumController < ApplicationController

  before do
    if !(@user = User.find_by(id: session[:user_id]))
      create_message("You need to be logged in to view that page.", "notice")
      redirect '/account/login'
    end
  end

  get "/curriculum" do 
    @title = "Curriculum"
    erb :'curriculum/index'
  end
end
