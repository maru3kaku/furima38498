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
     pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private


  def order_params
    params.require(:form_object).permit(:post_code,:prefecture_id,:city,:address,:building_name,
      :telephone_number,:token).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def item_params
    params.require(:item).permit(:image, :id,:title, :concept, :status_id, :category_id, :delivery_charge_burden_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
end
end