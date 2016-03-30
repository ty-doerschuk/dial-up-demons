class Answer < ActiveRecord::Base
  validates :text, :author_id, :question_id, presence: true
end
