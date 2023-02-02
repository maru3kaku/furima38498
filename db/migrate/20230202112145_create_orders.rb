class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price ,null: false
      t.integer :item ,null: false
      t.integer :card_no ,null: false         #カードの番号
      t.integer :card_year ,null: false #カードの有効期限(年)
      t.integer :card_month ,null: false #カードの有効期限（月） 
      t.integer :card_cvc ,null: false        #カードのCVC
      t.timestamps
    end
  end
end
