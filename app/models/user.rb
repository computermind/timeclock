require 'bcrypt'
class User < ApplicationRecord
  attr_accessor :old_password, :email, :name, :password, :password_confirmation  

  include BCrypt
  
  has_many :employees
  has_many :punches, through: :employees
  
  validates :username, presence: :true, uniqueness: true
  validates :password, presence: :true, length: {minimum: 6}, on: :create
#  validates :password, presence: :true, length: {minimum: 6}, on: :update,  if: :password_match?, allow_blank: true

#  has_secure_password
  
#  validates :password, length: { minimum: 6 }, allow_nil: true  

 
  def password_match?
   current_password = BCrypt::Password.new(User.find(self.id).password_digest)
    
    if current_password == self.old_password || self.password.blank?
      true
    else
      errors.add(:password, "did not match.") unless errors[:password].include?("did not match.")
    end
  end
  
end
