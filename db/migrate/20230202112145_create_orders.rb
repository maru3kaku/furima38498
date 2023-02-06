class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price ,null: false          #価格
      t.integer :item ,null: false           
      t.integer :card_no ,null: false         #カードの番号
      t.integer :card_year ,null: false #カードの有効期限(年)
      t.integer :card_month ,null: false #カードの有効期限（月） 
      t.integer :card_cvc ,null: false        #カードのCVC
      t.timestamps
      t.references :user, null: false, foreign_key: true #ユーザー
     
      t.references :item,    null: false, foreign_key: true #カード情報
  
    end
  end
end
