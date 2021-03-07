class ManagementsController < ApplicationController
  before_action :authenticate_seller!


  def top
    @items = current_seller.items.order('created_at DESC')
  end

  def items
    @items = current_seller.items.order('created_at DESC')
  end

  def orders
    items = current_seller.items
    @orders = Order.where(item_id: items.ids).order('created_at DESC')
  end

  def roomindex
    @rooms = current_seller.rooms
  end

  def messageindex
    @room = Room.find(params[:format])
    @messages = @room.messages
    @message = Message.new
    set_item_name
  end

  def messagecreate
    @room = Room.find(params[:format])
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to  messageindex_managements_path(@room.id), notice: "メッセージを送信しました"
    else
      @messages = Message.where(params[:format])
      set_item_name
      redirect_to messageindex_managements_path(@room.id), notice: "メッセージ送信に失敗しました。内容を確認してください"
    end
  end

  def roomcreate
    if Room.exists?(seller_id: "#{current_seller.id}", user_id: params[:format])
      @room = Room.find_by(seller_id: "#{current_seller.id}", user_id: params[:format])
      redirect_to messageindex_managements_path(@room.id)
    else
      @room = Room.create(seller_id: current_seller.id, user_id: params[:format])
      redirect_to messageindex_managements_path(@room.id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:item_name, :message).merge(room_id: @room.id, whom: current_seller.store_name )
  end

  def set_item_name
    @items = Item.where(seller_id: @room.seller.id)
    @item_name = []
    @items.each do |item|
      @item_name.push(item.name)
    end
    @item_name.push("その他")
  end
end
