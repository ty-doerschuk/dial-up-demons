class Vote < ActiveRecord::Base
  validates_presence_of :voteable_id, :voteable_type
  validates :voter, :uniqueness => { :scope => [:voteable_type, :voteable_id]}

  belongs_to :voter, class_name: "User"
  belongs_to :voteable, polymorphic: true

end
