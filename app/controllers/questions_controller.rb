get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  @user = User.find(session[:user_id])
  if request.xhr?
    erb :'questions/_new', layout: false
  else
    erb :'questions/new'
  end
end

post '/questions' do
  @new_question = Question.new(params[:question])
  if request.xhr?
    if @new_question.save
      erb :"questions/_new_post", layout: false, locals: { question: @new_question }
    else
      @errors = @new_question.errors.full_messages
      erb :'questions/new'
    end
  end
end

# add answer to fave answer of question
patch '/questions' do 
  if session[:user_id]
    question = Question.find(params[:question_id])
    fave_answer = Answer.find(params[:answer_id])
    question.favorite_answer = fave_answer
    question.save
  end
  redirect "/questions/#{params[:question_id]}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show', locals: {question: @question}
end

post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  if params[:vote] == "vote up"
    new_vote = @question.votes.build(voter: current_user).save
  elsif params[:vote] == "vote down"
    if @question.votes.count > 0
      @question.votes.first.destroy
    end
  end
  if request.xhr?
    "Votes: #{@question.votes.count}"
  else
    redirect "/questions/#{params[:id]}"
  end
end
