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



post "/surveys/:id" do # Route for Voting -- Working
  @user = User.find_by(id: session[:user_id])
  @survey = Survey.find(params[:id])

  @survey.questions.each do |q|
    Response.create(choice_id: params[:"#{q.id}"], voter_id: session[:user_id])
  end

  erb :"surveys/_done"
end




put "/surveys/:id" do # Route for edit -- Broken
  @survey = Survey.find(params[:id])
  @questions = Question.find_by(survey_id: @survey.id)
  @choices = Choice.find_by(question_id: @questions.id)

  @survey.update(params[:survey])
  @questions.update(params[:question])
  @choices.update(params[:choice])

  redirect "/dashboard"
end

delete "/surveys/:id" do # Route for delete -- Working
  @survey = Survey.find(params[:id])

  @survey.responses.each {|response| response.delete }
  @survey.choices.each {|choice| choice.delete }
  @survey.questions.each {|question| question.delete }
  @survey.delete


  redirect "/dashboard"
end





