class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  #before_save { self.email = email.downcase }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 } #rails tutorial
  validates :email, presence: true, length: { maximum: 255 }, 
                    #format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #rails tutorial
  #has_secure_password  #rails tutorial
  #validates :password, presence: true, length: { minimum: 6 }  #rails tutorial
end
