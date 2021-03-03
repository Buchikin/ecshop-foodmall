class FavoritesellersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @favoritesellers = FavoriteSeller.where(user_id: current_user.id, checked: true)
  end

end
