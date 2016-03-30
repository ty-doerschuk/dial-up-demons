class Answer < ActiveRecord::Base
  validates :text, :author_id, :question_id, presence: true

  belongs_to  :question
  belongs_to  :author, class_name: "User", foreign_key: :author_id
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

end
