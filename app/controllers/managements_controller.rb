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
      redirect_to  messageindex_managements_path(@room.id)
    else
      @messages = Message.where(params[:format])
      set_item_name
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
