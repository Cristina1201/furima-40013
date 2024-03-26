class OrderBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "should be in the format of '3 digits - 4 digits'" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    return false if invalid?
      order = Order.create(user_id: user_id, item_id: item_id)
      Buyer.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
  
end
