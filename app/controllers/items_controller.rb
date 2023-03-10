class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    return unless @item.order.present?
    redirect_to root_path
  end


def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

def destroy
  if @item.destroy
    redirect_to root_path
  else
    redirect_to item_path
  end
end

  private
def item_params
  params.require(:item).permit(:image, :id, :title, :concept, :status_id, :category_id, :delivery_charge_burden_id, :prefecture_id,
                               :shipping_day_id, :price).merge(user_id: current_user.id)
end

def move_to_index
  return if current_user == @item.user
  redirect_to action: :index
end

def set_item
  @item = Item.find(params[:id])
end
end