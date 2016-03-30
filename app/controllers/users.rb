enable 'sessions'

get '/users/new' do
  erb :'/users/new' #show new users view
end

post '/users' do
  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user
  if @user.save #saves new user or returns false if unsuccessful
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}" #redirect back to users index page
  else
    @errors = @user.errors.full_messages
    # @errors = @entry.errors.full_messages
    erb :'users/new' # show new users view again(potentially displaying errors)
  end
end

get '/users/:id' do
  #gets params from url
  @user = User.find(params[:id]) #define instance variable for view
  erb :'users/show' #show single user view
end

