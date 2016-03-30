class Comment < ActiveRecord::Base
  validates :text, :author_id, presence: true

  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable
  belongs_to :author, class_name: "User"

end
