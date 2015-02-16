before "/surveys/:anything" do
  if session[:user_id]
    @user = User.find_by(id: session[:user_id])
  else
    session.delete(:user_id)
    redirect "/" #Need to add a message prompt to login
  end
end

get '/surveys' do
  @user = User.find_by(id: session[:user_id])
  @surveys = Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys/new' do
  if request.xhr?
    @survey = Survey.new params[:survey]
    @survey.creator_id = @user.id
    @survey.save

    session[:survey_id] = @survey.id

    content_type :json
    {survey: @survey}.to_json
  end
end

#Trying to render the stats partial on the survey list page
# get "/surveys/:id/stats" do

#   if request.xhr?
#     @survey = Survey.find(params[:id])
#     erb :"surveys/_stats"
#   end

# end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  session[:survey_id] = @survey.id

  erb :'/surveys/show'
end


post "/surveys/:id" do # Route for Voting -- Working
  @survey = Survey.find(params[:id])

  @survey.questions.each do |q|
    Response.create(choice_id: params[:"#{q.id}"], voter_id: session[:user_id])
  end

  erb :"surveys/_done"
end


put "/surveys/:id" do # Route for Survey -- Working
  @survey = Survey.find(params[:id])
  @survey.update(params[:survey])

  erb :"surveys/show"
end

delete "/surveys/:id" do # Route for delete -- Working
  @survey = Survey.find(params[:id])

  @survey.responses.each {|response| response.delete }
  @survey.choices.each {|choice| choice.delete }
  @survey.questions.each {|question| question.delete }
  @survey.delete

  redirect "/dashboard"
end





