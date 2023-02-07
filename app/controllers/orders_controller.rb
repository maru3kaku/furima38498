class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  #before_action :set_order,only: :create
  def index
    @item = Item.find(params[:item_id])
    @order = FormObject.new
  end

  def create
    @order = FormObject.new(order_params)
    if @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private


  def order_params
    params.require(:form_object).permit(:card_cvc,:card_year,:card_month,:card_no,:price,
      :building_name,:prefecture_id,:telephone_number, :address,:post_code,:city,:item_id)
  end

  def item_params
    params.require(:item).permit(:image, :id,:title, :concept, :status_id, :category_id, :delivery_charge_burden_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end