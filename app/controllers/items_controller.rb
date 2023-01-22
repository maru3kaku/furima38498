class ItemsController < ApplicationController
  def index
    
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
  
  
  def item_params
    params.require(:item).permit(:image,:title,:concept,:status_id,:category_id,:delivery_charge_burden_id,:prefecture_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end

end