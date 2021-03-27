class LearnsController < ApplicationController
  def index
    @learns = Learn.all
  end

  def new
    @learn = Learn.new
  end

  def create
    @learn = Learn.create(learn_params)
    binding.pry

    if @learn.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def learn_params
    params.require(:learn).permit(:job_id, :gender_id, :study, :prefecture_id, :area_id, :area_provided, :thankyou_money,
                                  :learn_num_id, :condition).merge(user_id: current_user.id)
  end
end
