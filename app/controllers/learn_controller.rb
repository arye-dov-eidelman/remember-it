class LearnController < ApplicationController

  get "/l" do
    'tracks'
  end

  get "/l/:track" do
    'track'
  end

  get "/l/:track/:chapter" do
    'chapter'
  end

  get "/l/:track/:chapter/:quiz" do
    'quiz'
  end

  get "/l/:track/:chapter/:quiz/:question" do
    'question'
  end

end
