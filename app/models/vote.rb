class Vote < ActiveRecord::Base
  validates_presence_of :voteable_id, :voteable_type
end
