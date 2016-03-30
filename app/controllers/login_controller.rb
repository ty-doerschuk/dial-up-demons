get '/login' do
  erb :'login/index'
end

post '/login' do
  email = params[:email]
  password = params[:password]
  @user = User.where(email: email).first
  if @user
    if @user.authenticate_password(password)
      session[:user_id] = @user.id
      redirect '/decks'
    end
  else
    @errors = ['Please enter a valid password and email.']
    erb :'login/index'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
