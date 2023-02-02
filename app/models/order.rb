class Order < ApplicationRecord
  validates :price, presence: true
  validates :card_no , presence: true
  validates :card_year , presence: true
  validates :card_month, presence: true
  validates :card_cvc, presence: true
end
