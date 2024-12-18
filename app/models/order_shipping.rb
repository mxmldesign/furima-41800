class OrderShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: "is invalid" }
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end