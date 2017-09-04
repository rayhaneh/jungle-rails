class User < ActiveRecord::Base

  # When using has_secure_password,
  # the following validations are added automatically:
  # - Password must be present on creation
  # - Password length should be less than or equal to 72 characters

  has_secure_password
  has_many :reviews

  validates :name, :email, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 8}


  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where("lower(email) = ?", email.downcase).first
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
