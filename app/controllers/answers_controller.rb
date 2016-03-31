before '/answer/*' do
  redirect "/session/new" unless logged_in?
end

get '/answers/new' do
  @question = Question.find(params[:question_id])
  erb :"answers/new"
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :"answers/show", locals: {answer: @answer}
end

post '/answers' do
  @answer = Answer.create(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end
