class TestsController < ApplicationController
  before_action :set_test, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @tests = Test.includes(:users).order('created_at DESC')
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    users = @test.users
    users.each do |user|
      if user.id == @test.examiner_id
        @examiner = user
      else
        @examinee = user
      end
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      render :edit
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:examiner_id, :test_date, :test_category_id, :result, :comment, user_ids: [])
  end

  def move_to_index
    test = Test.find(params[:id])
    redirect_to root_path if current_user.id != test.examiner_id
  end
end
