#landing page "/"
#"/login"

get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/login' do
  erb :login
end

post '/login' do
  # sign-in
  user = User.authenticate(params[:username], params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :login
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :login
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/dashboard'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :login
  end
end

