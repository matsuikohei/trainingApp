class TestCommentsController < ApplicationController
  def create
    @test = Test.find(params[:test_id])
    test_comment = TestComment.new(test_comment_params)
    if test_comment.save
      redirect_to "/tests/#{test_comment.test_id}"
    else
      @test_comments = @test.test_comments.includes(:user)
      redirect_to "/tests/#{@test.id}"
    end
  end

  def test_comment_params
    params.require(:test_comment).permit(:content).merge(user_id: current_user.id, test_id: params[:test_id])
  end
end