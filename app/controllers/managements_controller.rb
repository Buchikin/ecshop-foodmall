class ManagementsController < ApplicationController

  def top
    @items = current_seller.items
  end

  def items
    @items = current_seller.items
  end
end
