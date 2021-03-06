class MessagesController < ApplicationController
  before_action :set_room, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :check_user, only: [:index, :create]


  def index
    @messages = @room.messages
    @message = Message.new
    set_item_name
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to room_messages_path(@room.id), notice: "メッセージを送信しました"
    else
      @messages = Message.where(room_id: params[:room_id])
      set_item_name
      flash.now[:alert] = "送信に失敗しました"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:item_name, :message).merge(room_id: @room.id, whom: (current_user.profile.last_name + current_user.profile.first_name) )
  end

  def set_item_name
    @items = Item.where(seller_id: @room.seller.id)
    @item_name = []
    @items.each do |item|
      @item_name.push(item.name)
    end
    @item_name.push("その他")
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def check_user
    if @room.user_id != current_user.id
      redirect_to rooms_path
    end
  end
  
end
