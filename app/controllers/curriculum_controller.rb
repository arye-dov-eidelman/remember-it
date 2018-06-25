class CurriculumController < ApplicationController

  get "/c" do
    'Curriculum'
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

end
  