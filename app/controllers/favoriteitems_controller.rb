class FavoriteitemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @favoriteitems = FavoriteItem.where(user_id: current_user.id, checked: true)
  end
end
