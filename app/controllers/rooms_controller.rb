class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
  end

  def create
    if Room.exists?(user_id: "#{current_user.id}", seller_id: params[:format])
      @room = Room.find_by(user_id: "#{current_user.id}", seller_id: params[:format])
      redirect_to room_messages_path(@room.id)
    else
      @room = Room.create(user_id: current_user.id, seller_id: params[:format])
      redirect_to room_messages_path(@room.id)
    end
  end

end
