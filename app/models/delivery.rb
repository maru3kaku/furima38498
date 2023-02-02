class Delivery < ApplicationRecord
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true{ other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true,format: {with: /\A[0-9]\z/,message: "can't be blank"}

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
