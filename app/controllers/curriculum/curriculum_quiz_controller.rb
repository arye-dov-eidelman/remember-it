class CurriculumQuizController < CurriculumController

  get "/quizzes/:quiz_id/edit" do
    (return 404) if !(@quiz = Quiz.find_by(id: params[:quiz_id]))
    (return 403) if @quiz.owner != @user
    erb :'quizzes/edit'
  end
  
  patch '/quizzes/:quiz_id' do
    (return 404) if !(quiz = Quiz.find_by(id: params[:quiz_id]))
    (return 403) if quiz.owner != @user

    if params[:quesions]
      # params[:quesions].each do |question_id, question_values|
      #   if !question_values[:title].strip.empty?
      #     question = Question.find_by(id: question_id)
      #     question.title = question_values[:title].strip
      
      #     # if question_values[:answers]
      #     #   question_values[:answers].each do |answer_id, answer_values|
      #     #     if !answer_values[:content].strip.empty?
      #     #       answer = Answer.find_by(id: answer_id)
      #     #       answer.content = answer_values[:content].strip
      #     #       answer.is_correct = answer_values[:is_correct].to_b
      #     #       answer.save
      #     #     else
      #     #       answer = Answer.find_by(id: answer_id)
      #     #       answer.destroy
      #     #     end
      #     #   end
      #     # end
      
      #     question.save
      #   else
      #     question = Question.find_by(id: question_id)
      #     question.destroy
      #   end
      # end
    end
    
    quiz_params = params[:quiz]

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
                  answer.is_correct = answer_param[:is_correct] # answer[:is_correct].to_b ?? figure out if it's corect or not!! ################################
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
