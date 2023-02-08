class FormObject
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:city,:address,:building_name,:telephone_number,
  :price,:card_no,:card_year,:card_month,:card_cvc,:user_id,:item_id
  
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :address, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :telephone_number, presence: true,format: {with: /\A[0-9]\z/,message: "can't be blank"}
  validates :prefecture_id, presence: true,numericality: { other_than: 0, message: "can't be blank" }

  validates :price, presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}     #価格
  validates :card_no , presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}    #カード番号
  validates :card_year , presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}  #カード有効期限の年
  validates :card_month, presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}  #カード有効期限の月
  validates :card_cvc, presence: true, format:{with: /\A[0-9]\z/, message: "is invalid. "}    #カードのcvc

  
  def save
    Order.create(price: price,card_no: card_no,card_year: card_year,card_month: card_month,card_cvc: card_cvc,user_id: user_id,item_id: item_id)
    Delivery.create(post_code: post_code,city: city,address: address,telephone_number: telephone_number,prefecture_id: prefecture_id)
  end
end