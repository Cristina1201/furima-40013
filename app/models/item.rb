class Item < ApplicationRecord

  belongs_to :user

  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_price_id, presence: true
  validates :place_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { in: 300..9999999, only_integer: true }
  validates :image, presence: true

  
end
