enable 'sessions'

get '/session/new' do
  erb :'/session/new'
end

post '/session' do
  @user = User.find_by(email: params[:user][:email])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}" #redirect back to users index page
  else
    @errors = @user.errors.full_messages
    erb :'/session/new'
  end
end

get '/session/logout' do
  session[:user_id] = nil
  redirect '/'
end
