class TestsController < ApplicationController
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

  private
  def test_params
    params.require(:test).permit(:test_date, :test_category_id, :result)
  end
end
