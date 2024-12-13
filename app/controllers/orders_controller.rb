class OrdersController < ApplicationController
  def index
    
  end

  def create
    @order = Order.create(order_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
  end
  
  private
  def order_params
    params.permit('#').merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(order_id: @order.id)
  end
end