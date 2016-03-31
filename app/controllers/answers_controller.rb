get '/answers/new' do
  @question = Question.find(params[:question_id])
  erb :"answers/new"
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :"answers/show"
end

post '/answers' do
  @answer = Answer.create(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end

post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  if params[:vote] == "vote up"
    new_vote = @answer.votes.build(voter: current_user).save
  elsif params[:vote] == "vote down"
    if @answer.votes.count > 0
      @answer.votes.first.destroy
    end
  end
  redirect "/questions/#{@answer.question.id}"
end
