class SellersController < ApplicationController
  def show
    @seller = Seller.find(params[:id])
    @items = @seller.items
  end

  def checked
    if FavoriteSeller.exists?(user_id: "#{current_user.id}", seller_id: params[:id])
      favoriteseller = FavoriteSeller.find_by(user_id: "#{current_user.id}", seller_id: params[:id])
      if favoriteseller.checked
        favoriteseller.update(checked: false)
      else
        favoriteseller.update(checked: true)
      end
    else
      favoriteseller = FavoriteSeller.create(user_id: "#{current_user.id}", seller_id: params[:id], checked: true)
    end
    favoriteseller = FavoriteSeller.find_by(user_id: "#{current_user.id}", seller_id: params[:id])
    render json: { heart: favoriteseller }
  end
end
