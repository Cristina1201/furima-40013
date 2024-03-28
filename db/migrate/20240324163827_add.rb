class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :prefecture_id, :integer
    add_column :buyers, :prefecture_id, :integer
    add_column :items, :item_description, :text
  end
end
