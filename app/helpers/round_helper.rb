module DateFormatting
  def long_form_date(timestamp)
    timestamp.strftime('%B %e, %Y')
  end
end

helpers DateFormatting

def correct_guess_tracker
  Round.where()
end

helpers do

  def guessed_cards
    guessed_cards = []
    @round.guesses.each do |guess|
      if correct_guess?(guess)
        guessed_cards << guess.card.id
      end
    end
    return guessed_cards
  end

  def remaining_cards
    unguessed_cards = []
    @round.deck.cards.each do |card|
      unguessed_cards << card unless guessed_cards.include?(card.id)
    end
    return unguessed_cards
  end

  def next_card
    remaining_cards.shuffle.pop
  end
  # returns an array of card id numbers


  def game_over
    remaining_cards.empty? ? true : false
  end
end

# def rounds_played
#     rounds_hash = Hash.new {[]}
#     current_user.rounds.each do |round|
#       deck_name = round.deck.theme_name
#       puts date = long_form_date(round.created_at)
#       puts cards_in_deck = round.deck.cards.count
#       puts total_guesses = round.guesses.count
#       puts first_guess_correct = round.guesses.group('card_id').count.select {|card_id, count| count == 1}.count
#       puts rounds_hash[deck_name] += [{date: date, cards_in_deck: cards_in_deck, first_guess_correct: first_guess_correct, total_guesses: total_guesses}]
#       puts rounds_hash[deck_name]
#     end
#     return rounds_hash
#     # return {name: [{test: "test"}]}
#   end

  def correct_guess?(guess)
    guess.card.answer == guess.player_guess
  end
#   # Cards in deck

# end

