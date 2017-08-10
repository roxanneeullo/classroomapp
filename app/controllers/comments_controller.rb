class CommentsController < ApplicationController
 # before_action :set_activity
  
  def index
    @activity = Activity.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    
    if @comment.save
      flash[:success] = "You commented the hell out of that post!"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      redirect_to :back
    end
  end

  def destroy
    
    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to :back
  end
  private
  def set_comment
    @acomment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:user_id, :context, :activity_id)
  end

end
