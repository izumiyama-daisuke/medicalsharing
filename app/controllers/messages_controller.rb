class MessagesController < ApplicationController
  def index
    @learn = Learn.find(params[:learn_id])
    @relearns = Relearn.all.includes(:user).order("created_at DESC")
    @learns = Learn.all.includes(:user).order("created_at DESC")

    @room = Room.new     ####roomコントローラーにも同じコードを記載しています  不要か？
  end

  def show
    
  end
end

