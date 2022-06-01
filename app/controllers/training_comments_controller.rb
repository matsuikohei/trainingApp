class TrainingCommentsController < ApplicationController
  def create
    @training = Training.find(params[:training_id])
    training_comment = TrainingComment.new(training_comment_params)
    if training_comment.save
      redirect_to "/trainings/#{training_comment.training_id}"
    else
      redirect_to "/trainings/#{@training.id}"
    end
  end

  private
  def training_comment_params
    params.require(:training_comment).permit(:content).merge(user_id: current_user.id, training_id: params[:training_id])
  end
end
