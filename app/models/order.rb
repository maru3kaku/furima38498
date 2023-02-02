class Order < ApplicationRecord
  validates :price, presence: true      #価格
  validates :card_no , presence: true   #カード番号
  validates :card_year , presence: true #カード有効期限の年
  validates :card_month, presence: true #カード有効期限の月
  validates :card_cvc, presence: true   #カードのcvc
end
