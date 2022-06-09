class UsersController < ApplicationController
  before_action :move_to_show, only: :edit
  before_action :set_params, only: [:show, :edit, :update]

  def show
    @trainings = @user.trainings.where.not(trainer_id: @user.id).order("training_date DESC")
    @tests = @user.tests.where.not(examiner_id: @user.id).order("test_date DESC")
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :employee_number, :last_name, :first_name)
  end

  def move_to_show
    user = User.find(params[:id])
    redirect_to root_path if current_user.id != user.id
  end
end
