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
  p "========================"
  p params
  @question = Question.find(params[:id])
  if params[:vote] == "vote up"
    new_vote = @question.votes.build(voter: current_user).save
  elsif params[:vote] == "vote down"
    if @question.votes.count > 0
      @question.votes.first.destroy
    end
  end
  redirect "/questions/#{params[:id]}"
end
