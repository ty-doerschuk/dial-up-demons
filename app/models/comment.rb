class Comment < ActiveRecord::Base
  validates :text, :author_id, presence: true
end
