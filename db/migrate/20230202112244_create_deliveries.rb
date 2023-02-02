class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name #任意のためnull: false不要
      t.integer :telephone_number, null: false
      t.string :order, null: false
      t.timestamps
    end
  end
end
