class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 8}
end
