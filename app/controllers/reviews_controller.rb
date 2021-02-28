class ReviewsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
    @item = @order.item
  end

  def create
    @order = Order.find(params[:order_id])
    @item = @order.item
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:order_id])
    @review = Review.find(params[:id])
    @item = @order.item
  end

  def update
    @order = Order.find(params[:order_id])
    @item = @order.item
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :text).merge(user_id: current_user.id, item_id: @order.item.id, order_id: @order.id)
  end
end
