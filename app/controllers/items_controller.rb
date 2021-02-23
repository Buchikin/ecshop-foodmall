class ItemsController < ApplicationController

  def index
  end

  def new
    @new_item = NewItem.new
  end

  def create
    @new_item = NewItem.new(item_params)
    if @new_item.valid?
      @new_item.save
      redirect_to top_management_path
    else
      render :new
    end
  end
  


  private

  def item_params
    params.require(:new_item).permit(:image, :name, :price, :information, :tag1, :tag2, :tag3, :tag4, :tag5, :allergies, :prefecture_id, :ship_day_id, :ship_type_id, :count).merge(seller_id: current_seller.id)
  end
end
