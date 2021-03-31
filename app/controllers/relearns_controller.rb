class RelearnsController < ApplicationController
  def new
    @relearn = Relearn.new
  end


  def create
    @relearn = Relearn.create(relearn_params)
binding.pry
    if @relearn.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def relearn_params
    params.require(:relearn).permit(:job_id, :gender_id, :restudy, :restudytitle, :prefecture_id, :area_id, :area_provided,
                                  :learn_num_id, :condition).merge(user_id: current_user.id, learn_id: params[:learn_id])
  end
end
