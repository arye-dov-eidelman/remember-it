class CurriculumChapterController < ApplicationController

  before do
    if !(@user = User.find_by(id: session[:user_id]))
      create_message("You need to be logged in to view that page.", "notice")
      redirect '/account/login'
    end
  end

  get "/chapters/:chapter_id/edit" do
    (return 404) if !(@chapter = Chapter.find_by(id: params[:chapter_id]))
    (return 403) if @chapter.owner != @user
    erb :'chapters/edit'
  end
  
  patch '/chapters/:chapter_id' do
    (return 404) if !(chapter = Chapter.find_by(id: params[:chapter_id]))
    (return 403) if chapter.owner != @user

    if params[:quizzes]
      params[:quizzes].each do |quiz_id, quiz_values|
        if !quiz_values[:title].strip.empty?
          quiz = Quiz.find_by(id: chapter_id)
          quiz.title = quiz_values[:title].strip
          quiz.save
        else
          quiz = Quiz.find_by(id: chapter_id)
          quiz.destroy
        end
      end
    end

    if params[:new_quizzes]
      chapter.quizzes << params[:new_quizzes].collect do |quiz_params|
        Quiz.create(quiz_params) if !quiz_params[:title].strip.empty?
      end.compact
    end

    if chapter.update(params[:chapter])
      create_message("We've successfully updated Chapter \"#{chapter.title}\"", "successful")
      redirect "chapters/#{chapter.id}/edit"
    else
      create_message("That's odd. We couldn't update that Chapter.", "failure")
      redirect "chapters/#{chapter.id}/edit"
    end
  end
end
