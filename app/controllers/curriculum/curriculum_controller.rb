class CurriculumController < ApplicationController

  before do
    if !@logged_in
      create_message("You need to be logged in to view that page.", "notice")
      redirect '/account/login'
    end
    # create_message("CurriculumController before block ran", "notice")
  end

  get "/curriculum" do 
    @title = "Curriculum"
    erb :'curriculum/index'
  end
end
