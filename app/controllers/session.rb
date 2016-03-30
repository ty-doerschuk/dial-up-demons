enable 'sessions'

get '/session/new' do
  erb :'/session/new'
end

post '/session' do
  if @user = User.find_by(email: params[:user][:email])
    p @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}" #redirect back to users index page
  else
    erb :'/session/new'
  end
end
