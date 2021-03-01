class ManagementsController < ApplicationController
  before_action :authenticate_seller!


  def top
    @items = current_seller.items
  end

  def items
    @items = current_seller.items
  end

  def orders
    items = current_seller.items
    @orders = Order.where(item_id: items.ids)
  end
end
