class FavoritesellersController < ApplicationController

  def index
    @favoritesellers = FavoriteSeller.where(user_id: current_user.id, checked: true)
  end

end
