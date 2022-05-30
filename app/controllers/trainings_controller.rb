class TrainingsController < ApplicationController
  before_action :set_training, only: [:edit, :update]
  before_action :move_to_index, only: :edit

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

  def edit
  end

  def update
    if @training.update(training_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def training_params
    params.require(:training).permit(:trainer_id, :training_date, :training_category_id, :content, user_ids: [])
  end

  def set_training
    @training = Training.find(params[:id])
  end

  def move_to_index
    training = Training.find(params[:id])
    redirect_to root_path if current_user.id != training.trainer_id
  end
end
