get '/surveys' do
  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys/new' do
  @user = User.find_by(id: session[:user_id])
  new_survey = Survey.new params[:survey]
  new_survey.creator_id = @user.id
  # all_questions = params[:questions]

  # all_questions.each do |question|
  #   new_question = Question.new question: question.ask, survey_id: new_survey.id
  #   question.choices.each do |choice|
  #     Response.new choice: choice, question_id: new_question.id
  #   end
  # end
  new_survey.save
  erb :'/surveys/show'
end

get '/surveys/:id' do
  erb :'/surveys/show'
end

