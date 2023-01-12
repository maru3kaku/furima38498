class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
  end

  def destroy
    if item = Item.find(params[:id])
      item.destroy
     redirect_to root_path
   else
     redirect_to prototype_path
   end
 end

end
