class CurriculumController < ApplicationController

  get "/c" do
    erb :'Curriculum/index'
  end

  get "/c/:track" do
    'Curriculum track'
  end

  get "/c/:track/:chapter" do
    'Curriculum chapter'
  end

  get "/c/:track/:chapter/:quiz" do
    'Curriculum quiz'
  end

  get "/c/:track/:chapter/:quiz/:question" do
    'Curriculum question'
  end

  ## redirects ##

  get "/curriculum/*" do
    redirect "/c/#{params[:splat]}"    
  end

end
