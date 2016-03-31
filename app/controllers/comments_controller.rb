before '/comments/new' do
  redirect "/session/new" unless logged_in?
end

get '/comments/new' do
  if request.xhr?
    case params[:type]
      when "Question"
        @commentable_thing = Question.find(params[:question_id])
        erb :'comments/_q_c', layout: false, locals: { comment: @commentable_thing }
      when "Answer"
        @commentable_thing = Answer.find(params[:answer_id])
        erb :'comments/_a_c', layout: false, locals: { comment: @commentable_thing }
      end
  else
  case params[:type]
      when "Question"
        @commentable_thing = Question.find(params[:question_id])
        erb :'comments/new_question_comment'
      when "Answer"
        @commentable_thing = Answer.find(params[:answer_id])
        erb :'comments/new_answer_comment'
      end
  end

end

post '/comments' do
  @new_comment = Comment.new(params[:comment])
  if @new_comment.save
    if request.xhr?
      case @new_comment.commentable_type
        when "Question"
        erb :"questions/_show", layout: false, locals: { comment: @new_comment }
        when "Answer"
        erb :"answers/_show", layout: false, locals: { comment: @new_comment }
      end
    else
      case @new_comment.commentable_type
        when "Question"
        redirect "questions/#{@new_comment.commentable_id}"
        when "Answer"
        redirect "answers/#{@new_comment.commentable_id}"
      end
    end
  else
    @errors = @new_comment.errors.full_messages
    erb :"comments/new_question_comment"
  end
end
