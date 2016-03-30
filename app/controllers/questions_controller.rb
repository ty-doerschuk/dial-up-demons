get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @new_question = Question.new(params[:question])
  if @new_question.save
    redirect '/'
  else
    @errors = @new_question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  if params[:vote] == "vote up"
    p "+++++++++++++++++++++++++++++"
    p 'current user id'
    p current_user.id
    p "up vote!"
    p @question.votes.count
    p 'votes build below'
    p @question.votes.build(voter: current_user)
    p @question.votes.count
  elsif params[:vote] == "vote down"
    if @question.votes.count < 0
      @question.votes.first.destroy
    end
  end
  erb :"/questions/show"
end
