class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :ship_from_location_
  belongs_to :shipping_day_id

  belongs_to :user
  has_one_attached :image

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
