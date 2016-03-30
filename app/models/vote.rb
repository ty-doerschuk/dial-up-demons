class Vote < ActiveRecord::Base
  validates_presence_of :voteable_id, :voteable_type

  belongs_to :voter, class_name: :user
  belongs_to :voteable, polymorphic: true

end
