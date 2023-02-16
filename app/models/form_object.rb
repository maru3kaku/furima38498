class FormObject
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id, :order_id,
                :price, :token

  validates :token, presence: true

  validates :post_code, presence: true
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid.' }
  validates :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Delivery.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                     building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
