class Order < ApplicationRecord
  validates :price, presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}       #価格
  validates :card_no , presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}    #カード番号
  validates :card_year , presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}  #カード有効期限の年
  validates :card_month, presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}  #カード有効期限の月
  validates :card_cvc, presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}    #カードのcvc

  belongs_to :item
  belongs_to :user
  belongs_to :delivery
end
