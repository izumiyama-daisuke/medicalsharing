class RoomsController < ApplicationController
  def new         ##########indexの方が妥当か？
    @room = Room.new
  end
end
