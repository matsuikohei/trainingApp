class TrainingCommentsController < ApplicationController
  def create
    @training = Training.find(params[:training_id])
    training_comment = TrainingComment.new(training_comment_params)
    if training_comment.save
      redirect_to "/trainings/#{training_comment.training_id}"
    else
      @training_comments = @training.training_comments.includes(:user)
      redirect_to "/trainings/#{@training.id}"
    end
  end

  def destroy
    training_comment = TrainingComment.find(params[:id])
    training_comment.destroy
    redirect_to "/trainings/#{training_comment.training_id}"
  end

  private

  def training_comment_params
    params.require(:training_comment).permit(:content).merge(user_id: current_user.id, training_id: params[:training_id])
  end
end
