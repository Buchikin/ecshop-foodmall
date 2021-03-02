class FavoriteitemsController < ApplicationController

  def index
    @favoriteitems = FavoriteItem.where(user_id: current_user.id, checked: true)
  end
end
