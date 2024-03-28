class RemoveColumnFromTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :ship_from_location_id, :integer
    remove_column :items, :prefecture_id, :integer
    remove_column :buyers, :prefecture_id, :integer
  end
end
