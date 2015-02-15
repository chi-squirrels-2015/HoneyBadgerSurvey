before "/questions/:anything" do
   if session[:user_id]
    @user = User.find_by(id: session[:user_id])
  else
    session.delete(:user_id)
    redirect "/" #Need to add a message prompt to login
  end
end

post "/questions/new" do
  @question = Question.create(params[:question])
  @survey = Survey.find(session[:survey_id])
  @survey.questions << @question

  params[:choice].each do |choice|
    @question.choices << Choice.create(decision: choice)
  end


  if request.xhr?
    erb :"surveys/_saved_questions", locals: {survey: @survey, question: @question}, layout: false
  else
    erb :"surveys/new"
  end

end
