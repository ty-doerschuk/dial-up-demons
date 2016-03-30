require 'faker'


User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "12345")
User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "12345")
User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "12345")


Deck.create(theme_name: Faker::Hipster.word, creator_id: 1)
Deck.create(theme_name: Faker::Hipster.word, creator_id: 2)
Deck.create(theme_name: Faker::Hipster.word, creator_id: 3)

20.times do
  Card.create(question: Faker::Hipster.sentence, answer: Faker::Hacker.say_something_smart, deck_id: 1)
end

20.times do
  Card.create(question: Faker::Hipster.sentence, answer: Faker::Hacker.say_something_smart, deck_id: 2)
end

20.times do
  Card.create(question: Faker::Hipster.sentence, answer: Faker::Hacker.say_something_smart, deck_id: 3)
end

Round.create(deck_id: 1, player_id: 1, cards_left: 20)
Round.create(deck_id: 2, player_id: 2, cards_left: 20)
Round.create(deck_id: 3, player_id: 3, cards_left: 20)


guess_count = 1
20.times do
  Guess.create(round_id: 1, card_id: guess_count, player_guess: Faker::Hipster.sentence, player_id: 1)
  guess_count += 1
end

guess_count = 1
20.times do
  Guess.create(round_id: 2, card_id: guess_count, player_guess: Faker::Hipster.sentence, player_id: 2)
  guess_count += 1
end

guess_count = 1
20.times do
  Guess.create(round_id: 3, card_id: guess_count, player_guess: Faker::Hipster.sentence, player_id: 3)
  guess_count += 1
end
