class TrainingCommentChannel < ApplicationCable::Channel
  def subscribed
    @training = Training.find(params[:training_id])
    stream_for @training
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
