class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 4}


  def self.authenticate_with_credentials(email, password)
    email = email.strip
    # email = email.downcase
    # user = User.find_by_email(email)
    user = User.where("lower(email) = ?", email.downcase).first
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
