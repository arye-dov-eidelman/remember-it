class CurriculumController < ApplicationController

  get "/curriculum" do
    erb :'Curriculum/index'
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
