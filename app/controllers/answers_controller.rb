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
