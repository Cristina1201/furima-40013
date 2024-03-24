class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.references :order, null: false, foreign_key: true
      t.string :post_code, ull: false
      t.integer :ship_from_location_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
