require 'bcrypt'
class User < ApplicationRecord
  attr_accessor :old_password, :email, :name, :password, :password_confirmation  

  # users.password_hash in the database is a :string
  include BCrypt
#  def password
 #   @password ||= Password.new(password_hash)
  #end
  
  #def password=(new_password)
   #@password = Password.create(new_password)
    #self.password_hash = @password
  #end
  
  has_one :employee
  has_many :punches, through: :employee
  

  has_secure_password validations: true
  
  validates :username, presence: :true, uniqueness: true
  validates :password, presence: :true, length: {minimum: 6}, on: :create
  validates :password, presence: :true, length: {minimum: 6}, on: :update,  if: :password_match?, allow_blank: true

  

 
  def password_match?
   current_password = BCrypt::Password.new(User.find(self.id).password_digest)
    
    if current_password == self.old_password || self.password.blank?
      true
    else
      errors.add(:password, "did not match.") unless errors[:password].include?("did not match.")
    end
  end
  
end
