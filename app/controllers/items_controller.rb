class ItemsController < ApplicationController
  def index
    
  end
  
  def new
  
  end


  def create
      @item = Item.new(item_params)    
      if @Item.save
        redirect_to root_path
      else 
        render :new
    end
  end
  end
  
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

