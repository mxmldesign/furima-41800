class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
  end

  def create
  end

  private

  def message_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivering_day_id, :price, :image).merge(user_id: current_user.id)
  end
en,
