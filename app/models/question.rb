class Question < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answers
  has_one :favorite_answer, class_name: "Answer"

  def vote_count
    self.votes
  end

#   def favorite_answer=(answer_id)
#     self.favorite_answer = Answer.find(answer_id)
#     #self.favorite_answer_id = @favorite_answer.id
#     #self.save
#   end

#   def favorite_answer
#     @favorite_answer
#   end
 end
