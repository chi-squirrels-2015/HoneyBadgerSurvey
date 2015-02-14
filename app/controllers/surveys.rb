get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys/new' do
  @user = User.find_by(id: session[:user_id])
  if request.xhr?
    @survey = Survey.new params[:survey]
    @survey.creator_id = @user.id
    @survey.save

    content_type :json
    {content: @survey}.to_json
  end
end

  # all_questions = params[:questions]

  # all_questions.each do |question|
  #   new_question = Question.new question: question.ask, survey_id: new_survey.id
  #   question.choices.each do |choice|
  #     Response.new choice: choice, question_id: new_question.id
  #   end
  # end

get '/surveys/:id' do
  @user = User.find_by(id: session[:user_id])
  @survey = Survey.find(params[:id])

  erb :'/surveys/show'
end

