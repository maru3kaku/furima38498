class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:card_cvc,:card_year,:card_month,:card_no,:building_name,:prefecture_id,
      :telephone_number, :address,:post_code,:city)
  end

  def item_params
    params.require(:item).permit(:image, :id,:title, :concept, :status_id, :category_id, :delivery_charge_burden_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
  
end
