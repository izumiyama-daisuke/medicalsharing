class RelearnsController < ApplicationController
  def new
    @relearn = Relearn.find(params[:id])
  end

  def create
  end

end
