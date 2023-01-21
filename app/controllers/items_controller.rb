class ItemsController < ApplicationController
  def index
    
  end
  
  def new
  
  end


  def create
      @item = Item.new(prototype_params)    
      if @Item.save
        redirect_to root_path
      else 
        render :new
    end
  end
  end
  
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

