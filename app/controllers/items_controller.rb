class ItemsController < ApplicationController
  def index
    
  end
  
  def new
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def create
  end

  def destroy
     if @item.destroy
     redirect_to root_path
    else
      redirect_to root_path
    end
   end

 private

 def item_params
   params.require(:item).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
 end
end