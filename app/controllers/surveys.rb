get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys' do
  @user = User.find_by(id: session[:user_id])

  # all_questions = params[:questions]

  # all_questions.each do |question|
  #   new_question = Question.new question: question.ask, survey_id: new_survey.id
  #   question.choices.each do |choice|
  #     Response.new choice: choice, question_id: new_question.id
  #   end
  # end
  if request.xhr?
    new_survey = Survey.new params[:survey]
    new_survey.creator_id = @user.id
        
    content_type :json
    {new_survey}.to_json
  end

  new_survey.save
  erb :'/surveys/show'
end

get '/surveys/:id' do
  @user = User.find_by(id: session[:user_id])
  @survey = Survey.find(params[:id])

  erb :'/surveys/show'
end

