get '/comments/new' do
case params[:type]
  when "Question"
    @commentable_thing = Question.find(params[:question_id])
    erb :'comments/new_question_comment'
  when "Answer"
    @commentable_thing = Answer.find(params[:answer_id])
    erb :'comments/new_answer_comment'
  end

end

post '/comments' do
  @new_comment = Comment.new(params[:comment])
  if @new_comment.save
    case @new_comment.commentable_type
    when "Question"
      redirect "questions/#{@new_comment.commentable_id}"
    when "Answer"
      redirect "answers/#{@new_comment.commentable_id}"
    end
  else
    @errors = @new_comment.errors.full_messages
    erb :"comments/new_question_comment"
  end
end
