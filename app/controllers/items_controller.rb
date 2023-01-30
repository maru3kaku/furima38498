class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :update, :show]
  before_action :contributor_confirmation, only: [:edit, :update]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
   if @item.update(item_params)
     redirect_to item_path
   else
     render :edit
   end
 end


  def item_params
    params.require(:item).permit(:image, :title, :concept, :status_id, :category_id, :delivery_charge_burden_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
   end
   def contributor_confirmation
    unless current_user == @prototype.user
      redirect_to action: :index
  end
end
end