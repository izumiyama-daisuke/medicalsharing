class MessagesController < ApplicationController
  def index
    @learn = Learn.find(params[:learn_id])
    @relearns = Relearn.all.includes(:user).order("created_at DESC")
    @learns = Learn.all.includes(:user).order("created_at DESC")
    @message = Message.new
    @room = Room.new


    if params[:room_id].to_i != 0 # チャット相手を洗濯しないと入力欄を非表示 
      room_name = Room.find(params[:room_id])##ルーム名を表示する
      @room_name = room_name.name##ルーム名を表示する
      @@room = Room.find(params[:room_id])##メッセージを表示する
      @messages = @@room.messages.includes(:user).order("created_at DESC")##メッセージを表示する
    else
      @room_name = "ルームを選択してください！"##ルーム名を表示する
    end
  end

  def create
    @learn = Learn.find(params[:learn_id])
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    
    if @message.save
      redirect_to learn_room_messages_path(@learn, @room)
    else
      @messages = @room.messages.includes(:user)###必要か？メッセージを表示
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end

