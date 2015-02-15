before "/dashboard" do
  if session[:user_id]
    @user = User.find_by(id: session[:user_id])
  else
    session.delete(:user_id)
    redirect "/" #Need to add a message prompt to login
  end
end

get '/dashboard' do
  erb :'/users/index'
end
