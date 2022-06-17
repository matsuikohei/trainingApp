class TestCommentChannel < ApplicationCable::Channel
  def subscribed
    @test = Test.find(params[:test_id])
    stream_for @test
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
