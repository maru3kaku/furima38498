class Item < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true # 商品名
  validates :concept, presence: true # 商品の説明
  validates :category_id, presence: true # カテゴリー
  validates :status_id, presence: true # 商品状態
  validates :delivery_charge_burden_id, presence: true # 配送料の負担
  validates :prefecture_id, presence: true # 発送元の地域
  validates :shipping_day_id, presence: true            # 発送までの日数
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge_burden
  belongs_to :prefecture
  belongs_to :shipping_day
end
