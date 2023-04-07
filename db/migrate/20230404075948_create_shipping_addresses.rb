class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_code, null: false
      t.integer :delivery_area_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :room_number
      t.references :purchase_record, null: false, foreign_key:true
      t.timestamps
    end
  end
end
