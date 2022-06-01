class TrainingCommentsController < ApplicationController
  def create
    training_comment = TrainingComment.create(training_comment_params)
    redirect_to "/trainings/#{training_comment.training_id}"
  end

  private
  def training_comment_params
    params.require(:training_comment).permit(:content).merge(user_id: current_user.id, training_id: params[:training_id])
  end
end
