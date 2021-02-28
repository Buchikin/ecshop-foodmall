class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.order("created_at DESC")
  end

  def new
    @item = Item.find(params[:item_id])
    @charge = Charge.find(current_user.charge.id)
    @new_order = NewOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @stock = Stock.find(@item.stock.id)
    @charge = Charge.find(current_user.charge.id)
    purchase_price = params[:new_order][:quantity].to_i * @item.price
    @new_order = NewOrder.new(order_params(purchase_price))
    new_count = @stock.count - params[:new_order][:quantity].to_i
    new_pay = @charge.pay - purchase_price
    if params[:new_order][:quantity].to_i != 0 && @item.stock.count >= params[:new_order][:quantity].to_i &&  current_user.charge.pay >= purchase_price
      if @new_order.valid? && @stock.update(count: new_count) && @charge.update(pay: new_pay, token: "aaa")
        @new_order.save
        redirect_to items_path
      else
        render :new
      end
    else
      render :new
    end
    
  end

  private

  def order_params(purchase_price)
    params.require(:new_order).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code , :address, :quantity).merge(item_id: @item.id, user_id: current_user.id, purchase_price: purchase_price)
  end

end
