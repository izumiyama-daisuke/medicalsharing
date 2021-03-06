class MessagesController < ApplicationController
  def index
    @learn = Learn.find(params[:learn_id])
    @relearns = Relearn.all.includes(:user).order("created_at DESC")
    @learns = Learn.all.includes(:user).order("created_at DESC")
    @message = Message.new


    if params[:room_id].to_i != 0 # チャット相手を選択しないと入力欄を非表示 
      room_name = Room.find(params[:room_id])##ルーム名を表示する
      @room_name = room_name.name##ルーム名を表示する

      @@room = Room.find(params[:room_id])##メッセージを表示する
      @messages = @@room.messages.includes(:user).order("created_at DESC")##メッセージを表示する
      @room = Room.find(params[:room_id])##ルームを削除
    else
      @room = Room.new
      @room_name = "ルームを選択してください！"##ルーム名を表示する
    end
  end

  def create
 #   @learn = Learn.find(params[:learn_id])               Ajaxのため一時的にコメントアウトです。直します
 #   @room = Room.find(params[:room_id])
 #   @message = @room.messages.new(message_params)

    message = Message.create(message_params)     #非同期通信（投稿）
    render json:{ message: message }

    
  end

  def checked   #--------------------変更が必要です
    message = Message.find(params[:id])   #--------------------Post Messegeに変更
    if message.checked 
      message.update(checked: false)
    else
      message.update(checked: true)
    end

    item = Message.find(params[:id])#--------------------Post Messegeに変更
    render json: { message: item }
  end

  private

  def message_params
 #   arams.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, checked: false, room_id: @@room.id)
  end
end

