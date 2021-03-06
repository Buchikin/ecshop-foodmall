class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @orders = current_user.orders.order("created_at DESC")
  end

  def new
    @item = Item.find(params[:format])
    if Charge.exists?(user_id: "#{current_user.id}")
      @charge = Charge.find(current_user.charge.id)
    else
      @charge = Charge.new(pay: 0)
    end
    @new_order = NewOrder.new
  end

  def create
    @item = Item.find(params[:format])
    @stock = Stock.find(@item.stock.id)
    check_charge_exist
    purchase_price = params[:new_order][:quantity].to_i * @item.price
    @new_order = NewOrder.new(order_params(purchase_price))
    new_count = @stock.count - params[:new_order][:quantity].to_i
    new_pay = @charge.pay - purchase_price
    if params[:new_order][:quantity].to_i != 0 && @item.stock.count >= params[:new_order][:quantity].to_i &&  current_user.charge.pay >= purchase_price
      if @new_order.valid? && @stock.update(count: new_count) && @charge.update(pay: new_pay, token: "aaa")
        @new_order.save
        redirect_to items_path, notice: "購入が完了しました"
      else
        flash.now[:alert] = "お客様情報を確認してください"
        render :new
      end
    else
      flash.now[:alert] = "購入個数・在庫数・チャージ残高を確認してください"
      render :new
    end
    
  end

  private

  def order_params(purchase_price)
    params.require(:new_order).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code , :address, :quantity).merge(item_id: @item.id, user_id: current_user.id, purchase_price: purchase_price)
  end

  def check_charge_exist
    if Charge.exists?(user_id: current_user.id)
      @charge = Charge.find(current_user.charge.id)
    else
      @charge = Charge.create(pay: 0,user_id: current_user.id, token: "aaa")
    end
  end

end
