class FormObject
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id, :order_id,
                :price, :token
with_options presence: true do
  validates :token
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city
  validates :address
  validates :telephone_number,format: { with: /\A\d{10,11}\z/}
  validates :user_id
  validates :item_id
end

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Delivery.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                     building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
