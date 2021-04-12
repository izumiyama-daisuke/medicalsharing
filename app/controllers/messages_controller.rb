class MessagesController < ApplicationController
  def index
    @learn = Learn.find(params[:learn_id])
    @relearns = Relearn.all.includes(:user).order("created_at DESC")
    @learns = Learn.all.includes(:user).order("created_at DESC")

    ####roomコントローラーにも同じコードを記載しています  不要か？
    @message = Message.new     ####roomコントローラーにも同じコードを記載しています  不要か？
    @room = Room.new
  end

  def show
    
  end
end

