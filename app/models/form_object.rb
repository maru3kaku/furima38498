class FormObject
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:city,:address,:building_name,:telephone_number,
  :price,:card_no,:card_year,:card_month,:card_cvc,:user_id,:item_id
  # ここにバリデーションの処理を書く
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true,format: {with: /\A[0-9]\z/,message: "can't be blank"}
  validates :prefecture_id, presence: true,numericality: { other_than: 0, message: "can't be blank" }

  validates :price, presence: true      #価格
  validates :card_no , presence: true   #カード番号
  validates :card_year , presence: true #カード有効期限の年
  validates :card_month, presence: true #カード有効期限の月
  validates :card_cvc, presence: true   #カードのcvc

  
  def save
    # 各テーブルにデータを保存する処理を書く
    Order.create(price: price,card_no: card_no,card_year: card_year,card_month: card_month,card_cvc: card_cvc,user_id: user_id,item_id: item_id)
    Delivery.create(post_code: post_code,city: city,address: address,telephone_number: telephone_number,prefecture_id: prefecture_id)
  end
end