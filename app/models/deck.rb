class Deck < ActiveRecord::Base
  validates :theme_name, presence: true
  belongs_to :creator, class_name: "User"
  has_many :cards
  has_many :rounds

  def most_recent
    self.cards.order(created_at: :desc)
  end
end
