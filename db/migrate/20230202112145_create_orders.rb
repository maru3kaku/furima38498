class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true #ユーザー
      t.references :item,    null: false, foreign_key: true #商品情報
    end
  end
end
