class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :ship_from_location
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :ship_from_location_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true, numericality: { in: 300..9999999, only_integer: true }
  validates :image, presence: true
   
validates :category_id, :condition_id, :postage_id, :ship_from_location_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
