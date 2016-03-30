helpers do

  def logged_in?
    session[:user_id]
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def redirect_login
    if !logged_in?
      redirect '/users/new'
    end
  end

  def cards_in_deck

  end

  # Returns a hash, where the key is the name of the deck, and the value is
  # an array of hashes, where each hash is a round played by that user
  # {"Rocket Scientists" => [{date: "september", cards_in_deck: 37}]
  # "Otter Facts" => [{}]
# => }
  def rounds_played
    rounds_hash = Hash.new {[]}
    current_user.rounds.each do |round|
      deck_name = round.deck.theme_name
      puts date = long_form_date(round.created_at)
      puts cards_in_deck = round.deck.cards.count
      puts total_guesses = round.guesses.count
      puts first_guess_correct = round.guesses.group('card_id').count.select {|card_id, count| count == 1}.count
      puts rounds_hash[deck_name] += [{date: date, cards_in_deck: cards_in_deck, first_guess_correct: first_guess_correct, total_guesses: total_guesses}]
      puts rounds_hash[deck_name]
    end
    return rounds_hash
    # return {name: [{test: "test"}]}
  end

  def correct_guess?(guess)
    guess.card.answer == guess.player_guess
  end
  # Cards in deck

end
