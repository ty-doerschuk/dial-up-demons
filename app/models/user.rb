require 'bcrypt'
class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  #validate :password_validation #write this method

  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id
  has_many :answers, foreign_key: :author_id
  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

end
