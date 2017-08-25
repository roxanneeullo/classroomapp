class CommentsController < ApplicationController
  
  def index
    @activity = Activity.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    
    if @comment.save
      flash[:success] = "Your comment was successfully posted!"
      redirect_to :back
    else
      flash[:alert] = "Oops, something went wrong."
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
    @comment = Comment.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:user_id, :context, :activity_id)
  end
end
