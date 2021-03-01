class ItemsController < ApplicationController

  def index
    @items = Item.includes(:stock,:seller)
  end

  def show
    @item = Item.find(params[:id])
    #@item.allergies = @item.allergies
    @reviews = Review.where(item_id: @item.id)
  end

  def new
    @new_item = NewItem.new
  end

  def create
    @new_item = NewItem.new(item_params)
    @new_item.allergies = @new_item.allergies.join("・")
    if @new_item.valid?
      @new_item.save
      redirect_to top_managements_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if params[:item][:allergies] != nil
      params[:item][:allergies] = params[:item][:allergies].join("・")
    else
      params[:item][:allergies] = ""
    end
    if @item.update(edit_item_params)
      redirect_to items_managements_path
    else
      render :edit
    end
  end
  


  private

  def item_params
    params.require(:new_item).permit(:image, :name, :price, :information, :tag1, :tag2, :tag3, :tag4, :tag5, :prefecture_id, :ship_day_id, :ship_type_id, :count, allergies:[]).merge(seller_id: current_seller.id)
  end

  def edit_item_params
    params.require(:item).permit(:image, :name, :price, :information, :tag1, :tag2, :tag3, :tag4, :tag5, :prefecture_id, :ship_day_id, :ship_type_id, :allergies).merge(seller_id: current_seller.id)
  end
end
