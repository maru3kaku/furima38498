class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false                       #商品名
      t.text :concept, null: false                       #商品の説明
      t.integer :category_id  , null: false              #カテゴリー
      t.integer :status_id, null: false                  #商品状態
      t.integer :delivery_charge_burden_id , null: false #配送料の負担
      t.integer :prefecture_id, null: false              #発送元の地域
      t.integer :shipping_day_id, null: false            #発送までの日数
      t.integer :price, null: false                      #価格
      t.references :user, null: false, foreign_key: true #ユーザー
      t.timestamps
    end
  end
end
