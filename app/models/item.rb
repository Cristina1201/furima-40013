class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true, numericality: { in: 300..9999999, only_integer: true }
  validates :image, presence: true
   
validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
