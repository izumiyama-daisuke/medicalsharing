class RoomsController < ApplicationController


  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to learn_relearn_room_messages_path(room_id: @room.id)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
  #  redirect_to learn_path(room_id: 0, learn_id: params[:learn_id], id: params[:room_id] ) #元はroot_path
    redirect_to learn_relearn_room_messages_path(room_id: 0, learn_id: params[:learn_id], id: params[:room_id] )
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
