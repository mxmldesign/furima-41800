class OrderShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number, numericality: { only_integer: true, greater_than_or_equal_to: 1_000_000_000, less_than_or_equal_to: 99_999_999_999 }
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture: prefecture, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end