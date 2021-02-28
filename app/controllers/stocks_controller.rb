class StocksController < ApplicationController
  def edit
    @stock = Stock.find(params[:id])
    @item = Item.find(params[:item_id])
  end

  def update
    @stock = Stock.find(params[:id])
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
end