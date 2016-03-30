require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :rounds, foreign_key: :player_id
  has_many :decks, foreign_key: :creator_id
  has_many :guesses, foreign_key: :player_id
  has_many :guessed_cards, through: :guesses, source: :card
  has_many :created_cards, through: :decks, source: :cards

  validates :username, :email, presence: true, uniqueness: true


  def authenticate_password(password_input)
    self.password == password_input
  end

  def password
    Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
