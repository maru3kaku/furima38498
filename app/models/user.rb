class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  
  validates :birthday, presence: true
  validates :name_kana, presence: true
  validates :name, presence: true
  validates :sei_kana, presence: true
  validates :sei , presence: true
  validates :nickname, presence: true,length: { maximum: 6 }
 
end
