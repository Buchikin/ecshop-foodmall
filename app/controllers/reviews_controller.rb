class ReviewsController < ApplicationController
  before_action :set_order, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:new, :create, :edit, :update]

  def new
    @review = Review.new
    @item = @order.item
  end

  def create
    @item = @order.item
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to orders_path, notice: "評価・レビューが完了しました"
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @item = @order.item
  end

  def update
    @item = @order.item
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to orders_path, notice: "編集が完了しました"
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to orders_path, notice: "評価・レビューを削除しました"
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :text).merge(user_id: current_user.id, item_id: @order.item.id, order_id: @order.id)
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def check_user
    if @order.user_id != current_user.id
      redirect_to orders_path
    end
  end
end
