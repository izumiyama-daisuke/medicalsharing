class MessagesController < ApplicationController
  def index
    @learn = Learn.find(params[:learn_id])
    @relearns = Relearn.all.includes(:user).order("created_at DESC")
    @learns = Learn.all.includes(:user).order("created_at DESC")

    ####roomコントローラーにも同じコードを記載しています  不要か？
    #@message = Message.new     ####roomコントローラーにも同じコードを記載しています  不要か？
    #@room = Room.new
    @message = Message.new
    @room = Room.new
  end

  def create
    @learn = Learn.find(params[:learn_id])
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    
    if @message.save
      redirect_to learn_room_messages_path(@learn, @room)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end

