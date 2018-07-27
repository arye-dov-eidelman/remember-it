class CurriculumQuizController < CurriculumController

  # quiz edit page
  get "/quizzes/:quiz_id/edit" do
    (redirect 404) if !(@quiz = Quiz.find_by(id: params[:quiz_id]))
    (return 403) if @quiz.owner != @user
    erb :'quizzes/edit'
  end
  
  # update the quizz, it's questions and answers 
  patch '/quizzes/:quiz_id' do
    (redirect 404) if !(quiz = Quiz.find_by(id: params[:quiz_id]))
    (return 403) if quiz.owner != @user

    quiz_params = params[:quiz]

    # in this transaction all questions and answers in this quiz will be deleted 
    # and recreated from scratch (with new id's), to simplify the logic.
    # if you dont want a headache, do yourself a favor and skip to the end of this block! 😉
    Quiz.transaction do
      quiz.questions.destroy_all
      if quiz_params[:questions]
        quiz.questions << quiz_params[:questions].collect do |question_params|
          if !question_params[:title].strip.empty?
            question = Question.create(title: question_params[:title])
            if question_params[:answers]
              question.answers << question_params[:answers].collect do |answer_param|
                if !answer_param.strip.empty?
                  answer = Answer.create(content: answer_param)
                  answer.is_correct = answer_param[:is_correct] # answer[:is_correct].to_b ?? figure out if it's the correct answer or not!! ################################
                  answer.save!
                  answer
                end
              end.compact
            end
            question.save!
            question
          end
        end.compact
      end
      quiz.title = quiz_params[:title]
      quiz.save
    end
    
    if quiz.successfully_updated?
      create_message("We've successfully updated Quiz \"#{quiz.title}\"", "successful")
    else
      create_message("That's odd. We couldn't update that Quiz.", "failure")
    end
    redirect "quizzes/#{quiz.id}/edit"
  end
end
