get '/surveys' do
  erb :'/surveys/index.erb'
end

get '/surveys/new' do
  erb :'/surveys/new.erb'
end

post '/surveys/new' do
  new_survey = Survey.new params[:survey]

  all_questions = params[:questions]

  all_questions.each do |question|
    new_question = Question.new question: question.ask, survey_id: new_survey.id
    question.choices.each do |choice|
      Response.new choice: choice, question_id: new_question.id
    end
  end

  erb :'/surveys/show'
end

get '/surveys/:id' do
  erb :'/surveys/show'
end

