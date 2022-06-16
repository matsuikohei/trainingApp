class TestCommentsController < ApplicationController

  def create
    @test = Test.find(params[:test_id])
    test_comment = TestComment.new(test_comment_params)
    if test_comment.save
      comment = TestComment.find(test_comment.id)
      comment_created_at = l comment.created_at
      user = User.find(comment.user_id)
      render json: { post: comment, comment_created_at: comment_created_at, test: @test, current_user: current_user, user: user }
      # redirect_to "/tests/#{test_comment.test_id}"
    else
      @test_comments = @test.test_comments.includes(:user)
      redirect_to "/tests/#{@test.id}"
    end
  end

  def destroy
    test_comment = TestComment.find(params[:id])
    test_comment.destroy
    redirect_to "/tests/#{test_comment.test_id}"
  end
  private
  def test_comment_params
    params.require(:test_comment).permit(:content).merge(user_id: current_user.id, test_id: params[:test_id])
  end
end
