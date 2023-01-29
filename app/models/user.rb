class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :sei, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :sei_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input full-width characters.' }

  validates :birthday, presence: true
  validates :name_kana, presence: true
  validates :name, presence: true
  validates :sei_kana, presence: true
  validates :sei, presence: true
  validates :nickname, presence: true

  has_many :items
  include ActiveHash::Associations
  has_many :items
end
