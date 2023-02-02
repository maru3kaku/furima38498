class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price ,null: false
      t.integer :item ,null: false
      t.integer :card_year ,null: false
      t.integer :card_month ,null: false
      t.integer :card_cvc ,null: false
      t.timestamps
    end
  end
end
