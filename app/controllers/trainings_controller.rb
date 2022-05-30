class TrainingsController < ApplicationController
  def top
  end

  def index
    @trainings = Training.includes(:users).order('created_at DESC')
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def training_params
    params.require(:training).permit(:trainer_id, :training_date, :training_category_id, :content, user_ids: [])
  end
end
