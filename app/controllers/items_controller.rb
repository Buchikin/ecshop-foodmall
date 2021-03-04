class ItemsController < ApplicationController

  before_action :authenticate_seller!, only: [:new, :create, :edit, :update]
  
  def index
    @items = Item.includes(:stock,:seller).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Review.where(item_id: @item.id)
  end

  def new
    @new_item = NewItem.new
  end

  def create
    @new_item = NewItem.new(item_params)
    if @new_item.allergies != nil 
      @new_item.allergies = @new_item.allergies.join("・")
    else
      @new_item.allergies = "" 
    end
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

  def checked
    if FavoriteItem.exists?(user_id: "#{current_user.id}", item_id: params[:id])
      favoriteitem = FavoriteItem.find_by(user_id: "#{current_user.id}", item_id: params[:id])
      if favoriteitem.checked
        favoriteitem.update(checked: false)
      else
        favoriteitem.update(checked: true)
      end
    else
      favoriteitem = FavoriteItem.create(user_id: "#{current_user.id}", item_id: params[:id], checked: true)
    end
    favoriteitem = FavoriteItem.find_by(user_id: "#{current_user.id}", item_id: params[:id])
    render json: { heart: favoriteitem }
  end

  def search
    @search = params[:keyword]
    if @search != ""
      @items = Item.where(["name LIKE(?) OR information LIKE(?) OR tag1 LIKE(?) OR tag2 LIKE(?) OR tag3 LIKE(?) OR tag4 LIKE(?) OR tag5 LIKE(?)", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%"]).order('created_at DESC')
    else
      @items = Item.all.order('created_at DESC')
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
