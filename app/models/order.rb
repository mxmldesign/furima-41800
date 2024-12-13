class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_one :shipping_address
end
