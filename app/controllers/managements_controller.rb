class ManagementsController < ApplicationController
  before_action :authenticate_seller!


  def top
    @items = current_seller.items
  end

  def items
    @items = current_seller.items
  end
end
