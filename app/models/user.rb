class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, case_sensitive: false, :message => '%{value} has already been taken'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 3, maximum: 16}
  validates :password_confirmation, presence: true
  validates_confirmation_of :password_confirmation
  
  def self.authenticate_with_credentials (email, password)  
    user = User.find_by_email(email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end

end
