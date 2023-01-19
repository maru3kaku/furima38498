class Item < ApplicationRecord
  validate :title, presence: true                       #商品名
  validates :concept, presence: true                    #商品の説明
  validates :category_id  ,presence: true              #カテゴリー
  validates :status_id, presence: true                  #商品状態
  validates :delivery_charge_burden_id , presence: true #配送料の負担
  validates :prefecture_id,presence: true              #発送元の地域
  validates :shipping_day_id, presence: true            #発送までの日数
  validates :price, presence: true  


  belongs_to :user
  has_one_attached :image
end
