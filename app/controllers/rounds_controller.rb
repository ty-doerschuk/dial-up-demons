get '/decks/:id/round/new' do
  redirect '/login' unless logged_in?
  @round =  Round.new(deck_id: params[:id], player_id: session[:user_id])
  @card = @round.deck.cards.shuffle.pop
  @question = @card.question
  # @cards = @round.deck.cards.shuffle
  # @current_card = @cards.pop
  # @question = @current_card.question
  # @answer = @current_card.answer
  if @round.save
    erb :'gameplay/new'
  else
    redirect "/"
  end
end

get '/decks/:deck_id/round/:round_id' do
  redirect '/'
end

post '/rounds' do
  @round = Round.find(params[:round_id])
  guess = Guess.create!(round_id: params[:round_id], card_id: params[:card_id], player_guess: params[:player_answer], player_id: current_user.id)
  if correct_guess?(guess)
    if game_over
      redirect "/users/#{current_user.id}"
    end
    deck = @round.deck
    @card = next_card
    @question = @card.question
    @message = "Yay!!!"
    erb :'gameplay/new'
  else
    @message = "WRONG!"
    @card = next_card
    @question = @card.question
    erb :'gameplay/new'
  end
end

