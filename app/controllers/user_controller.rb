get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  password = params[:user][:password]
  puts password
  if @user.validate && password != ""
    @user.save!
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    @errors << "Password cannot be blank" if password == ""
    erb :'users/new'
  end
end

get '/users/:id' do
  if User.exists?(params[:id]) && current_user.id == params[:id].to_i
    @rounds_played = rounds_played
    @decks = current_user.decks
    erb :'users/show'
  else
    #raise error?
    redirect '/'
  end
end
