class ItemsController < ApplicationController

  def index
    @items = Item.includes(:stock,:seller)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @new_item = NewItem.new
  end

  def create
    @new_item = NewItem.new(item_params)
    @new_item.allergies = @new_item.allergies.join("・")
    binding.pry
    if @new_item.valid?
      @new_item.save
      redirect_to top_managements_path
    else
      render :new
    end
  end
  


  private

  def item_params
    params.require(:new_item).permit(:image, :name, :price, :information, :tag1, :tag2, :tag3, :tag4, :tag5, :prefecture_id, :ship_day_id, :ship_type_id, :count, allergies:[]).merge(seller_id: current_seller.id)
  end
end
