class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :email, presence: true
  validates :password, presence: true
  validates :birthday, presence: true
  validates :name_kana, presence: true
  validates :name, presence: true
  validates :sei_kana, presence: true
  validates :sei , presence: true
  validates :nickname, presence: true
 
end
