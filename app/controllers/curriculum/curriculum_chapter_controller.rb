class CurriculumChapterController < CurriculumController

  # the chapter edit page
  get "/chapters/:chapter_id/edit" do
    # return 404 for non existent chapters
    (redirect 404) if !(@chapter = Chapter.find_by(id: params[:chapter_id]))

    # return 403 for chapters that dont belong to the curent user
    (return 403) if @chapter.owner != @user
    erb :'chapters/edit'
  end
  
  # update chapter
  # delete and/or create quizzes.
  # edit quizz titles
  patch '/chapters/:chapter_id' do
    (redirect 404) if !(chapter = Chapter.find_by(id: params[:chapter_id]))
    (return 403) if chapter.owner != @user

    if params[:quizzes]
      params[:quizzes].each do |quiz_id, quiz_values|
        # update the title if it's not blank
        if !quiz_values[:title].strip.empty?
          quiz = Quiz.find_by(id: quiz_id)
          quiz.title = quiz_values[:title].strip
          quiz.save

        # delete the quiz if the title is empty
        else
          quiz = Quiz.find_by(id: quiz_id)
          quiz.destroy
        end
      end
    end

    # create new quizes
    if params[:new_quizzes]
      chapter.quizzes << params[:new_quizzes].collect do |quiz_params|
        Quiz.create(quiz_params) if !quiz_params[:title].strip.empty?
      end.compact
    end

    # update the chapter
    if chapter.update(params[:chapter])
      create_message("We've successfully updated Chapter \"#{chapter.title}\"", "successful")
      redirect "chapters/#{chapter.id}/edit"
    else
      create_message("That's odd. We couldn't update that Chapter.", "failure")
      redirect "chapters/#{chapter.id}/edit"
    end
  end
end
