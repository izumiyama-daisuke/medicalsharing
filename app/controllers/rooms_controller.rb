class RoomsController < ApplicationController


  def new
    @room = Room.new
  end

  def create
    #@room = Room.new(room_params)
    @room = Room.new(room_params)
    if @room.save
      redirect_to learn_room_messages_path(room_id: @room.id)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    #room = Room.find(params[:room_id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])#.merge(room_id: @room.id)いらない、あとで消す
  end
end
