class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :player, class_name: "User"
  belongs_to :card
end
