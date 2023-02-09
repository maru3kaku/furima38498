class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  #before_action :set_order,only: :create
  def index
    @item = Item.find(params[:item_id])
    @order = FormObject.new
  end

def new
  @order = FormObject.new
end


  def create
    @order = FormObject.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private


  def order_params
    params.require(:form_object).permit(:post_code,:prefecture_id,:city,:address,:building_name,
      :telephone_number).merge(user_id: current_user.id,item_id:params[:item_id])
  end

  def item_params
    params.require(:item).permit(:image, :id,:title, :concept, :status_id, :category_id, :delivery_charge_burden_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end