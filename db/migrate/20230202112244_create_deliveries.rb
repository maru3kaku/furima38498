class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name #任意のためnull: false不要
      t.integer :telephone_number, null: false
      t.references :user, null: false, foreign_key: true #ユーザーID
      t.references :item,    null: false, foreign_key: true #商品情報ID
      t.references :order,    null: false, foreign_key: true #注文情報ID
      t.timestamps
    end
  end
end
