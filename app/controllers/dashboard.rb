
get '/dashboard' do
  @user = User.find_by(id: session[:user_id])

  erb :'/users/index'
end
