class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :prevent_invalid_access, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def order_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token] )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_invalid_access
    redirect_to root_path if @item.user == current_user || @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
