class TestsController < ApplicationController

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
    @test = Test.find(params[:id])
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
    @test = Test.find(params[:id])
  end

  def update
  end

  private
  def test_params
    params.require(:test).permit( :examiner_id, :test_date, :test_category_id, :result, :comment,  user_ids: [] )
  end
end
