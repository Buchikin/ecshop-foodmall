class StocksController < ApplicationController
  before_action :set_stock
  before_action :authenticate_seller!
  before_action :check_seller

  def edit
    @item = Item.find(params[:item_id])
  end

  def update
    if @stock.update(stock_params)
      redirect_to items_managements_path
    else
      @item = Item.find(params[:item_id])
      render :edit
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:count)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def check_seller
    if @stock.item.seller_id != current_seller.id
      redirect_to items_managements_path
    end
  end
end