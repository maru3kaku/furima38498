class Delivery < ApplicationRecord
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :address, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :telephone_number, presence: true,format: {with: /\A[0-9]\z/,message: "can't be blank"}
  validates :prefecture_id, presence: true,numericality: { other_than: 0, message: "can't be blank" }

  belongs_to :item
  belongs_to :user
  belongs_to :order



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
