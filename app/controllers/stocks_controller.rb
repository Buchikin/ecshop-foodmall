class StocksController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    @stock = Stock.find(@item.stock.id)
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      redirect_to items_managements_path
    else
      render :edit
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:count)
  end
end
