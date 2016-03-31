class Question < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answers
  has_one :favorite_answer, through: :answers

end
