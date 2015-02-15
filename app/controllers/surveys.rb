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

post "/surveys/:id" do
  @user = User.find_by(id: session[:user_id])
  @survey = Survey.find(params[:id])
  @responses = Response.create(choice_id: params[:choice], voter_id: session[:user_id])

  erb :"surveys/show"
end




put "/surveys/:id" do
  @survey = Survey.find(params[:id])
  @questions = Question.find_by(survey_id: @survey.id)
  @choices = Choice.find_by(question_id: @questions.id)

  @survey.update(params[:survey])
  @questions.update(params[:question])
  @choices.update(params[:choice])

  redirect "/dashboard"
end




