class SellersController < ApplicationController
  def show
    @seller = Seller.find(params[:id])
    @items = @seller.items
  end
end
