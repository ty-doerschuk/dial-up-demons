class Card < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  has_many :players, through: :guesses, source: :player

  validates :question, :answer, presence: true
end
