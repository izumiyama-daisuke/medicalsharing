class LearnsController < ApplicationController
  def index
    @learns = Learn.all.includes(:user).order("created_at DESC")
  end

  def new
    @learn = Learn.new
  end

  def create
    @learn = Learn.create(learn_params)

    if @learn.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @learn = Learn.find(params[:id])
    @relearns = Relearn.all.includes(:user).order("created_at DESC")
  end

  def edit
    @learn = Learn.find(params[:id])
  end

  def update
    @learn = Learn.find(params[:id])
    @learn.update(learn_params)
    if @learn.save
      redirect_to learn_path(@learn.id)
    else
      render 'edit'
    end
  end


  def destroy
    @learn = Learn.find(params[:id])
    if @learn.user == current_user
      @learn.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def search
    @learns = Learn.search(params[:keyword])
  end

  private

  def learn_params
    params.require(:learn).permit(:job_id, :gender_id, :study, :studytitle, :prefecture_id, :area_id, :area_provided, :thankyou_money,
                                  :learn_num_id, :condition).merge(user_id: current_user.id)
  end
end

