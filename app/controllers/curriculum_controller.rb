class CurriculumController < ApplicationController

  before do
    (@user = User.find_by(id: session[:user_id])) || (redirect '/account/login')
  end

  get "/curriculum" do
    @title = "Curriculum"
    erb :'curriculum/index'
  end

  get "/curriculum/:track" do
    'Curriculum track'
  end

  get "/curriculum/:track/:chapter" do
    'Curriculum chapter'
  end

  get "/curriculum/:track/:chapter/:quiz" do
    'Curriculum quiz'
  end

  ## redirects ##

  get "/c/*" do
    redirect "/curriculum/#{params[:splat]}"    
  end

end
