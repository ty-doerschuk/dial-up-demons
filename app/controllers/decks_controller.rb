

#If a user is not logged in, they cannot see or play a game
before '/decks*' do
  redirect '/users/new' unless logged_in?
end
#decks index page, shows all the decks
get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

#routes to form for naming a new deck
get '/decks/new' do
  erb :'/decks/new'
end

#creates new deck from inputted theme_name and routes to deck edit page
post '/decks' do
  @deck = current_user.decks.new(params[:deck])
  if @deck.save
    redirect "/decks/#{@deck.id}/edit"
  else
    @errors = @deck.errors.full_messages
    erb :'/decks/new'
  end
end

#shows a deck, I don't think we need this
get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  erb :'/decks/show'
end

#shows the edit form for a deck and its cards
get '/decks/:deck_id/edit' do
  @deck = Deck.find(params[:deck_id])
  if @deck.creator == current_user
    erb :'/decks/edit'
  else
    redirect '/decks/index'
  end
end

get '/decks/:deck_id/delete' do
  @deck = Deck.find(params[:deck_id])
  @deck.destroy
  redirect '/decks'
end

put '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @deck.update(theme_name: params[:theme_name])
  if @deck.save
    redirect "/decks/#{@deck.id}/edit"
  else @errors = @deck.errors.full_messages
    erb :'/decks/edit'
  end
end

delete '/decks/:deck_id/cards' do
  p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  p params[:card_id].to_i
  p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  @deck = Deck.find(params[:deck_id])
  # @card = Card.find_by(id: params[:card_id])
  # p params[:card_id]
  # p Card.where(id: params[:card_id])
  @card = Card.find(params[:card_id])
  @card.destroy
  redirect "/decks/#{@deck.id}/edit"
end

put '/decks/:deck_id/cards' do
  @deck = Deck.find(params[:deck_id])
  p params[:card_id]
  @card = Card.find_by(id: params[:card_id].to_i)
  p @card
  @card.update(question: params[:question], answer: params[:answer])
  if @card.save
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p @card
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!"
    redirect "/decks/#{@deck.id}/edit"
  else
    @errors = card.errors.full_messages
    erb :'/decks/edit'
  end
end

post '/decks/:deck_id/cards' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.new(params[:card])
  if @card.save
    p "&&&&&&&&&&&&&&&&&&&&&&&&"
    p @card.id
    p "&&&&&&&&&&&&&&&&&&&&&&&&"
    redirect "/decks/#{@deck.id}/edit"
  else
    @errors = @card.errors.full_messages
    erb :'/decks'
  end
end

