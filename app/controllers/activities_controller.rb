class ActivitiesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @activities = Activity.all
    @activity = Activity.new
    @teachers = Teacher.includes(User)
  end

  def show
   # @comments = Comment.all
    @comments = Comment.all
     
    #@comment = current_user.comments.create(comment_params)

     # if @comment.save
      #  redirect_to :back
       # flash[:notice] = "Post created!"
    #  else
        
     #  redirect_to :back
      #  flash[:notice] = "Post cannot be blank!"
    #  end
  end

  def edit
  end

  def create
    @activity = Activity.create(activity_params)

      if @activity.save
        flash[:success] = "Activity was successfully posted!"
        redirect_to :back
      else
        flash[:danger] = "Ooops!"
        redirect_to :back
      end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    flash[:danger] = "Activity abolished!"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:activity_type, :content, :section_id, :teacher_id)
    end
 
end
