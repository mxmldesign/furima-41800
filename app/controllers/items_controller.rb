class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :prevent_invalid_access, only: [:edit, :update, :delete]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '投稿を削除しました。'
    else
      redirect_to item_path(@item), alert: '削除に失敗しました。'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :delivering_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if @item.user == current_user

    redirect_to action: :index
  end

  def prevent_invalid_access
    redirect_to root_path if @item.order.present?
  end
end
