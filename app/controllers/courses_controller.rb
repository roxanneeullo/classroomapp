class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @courses = Course.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @course = Course.new
  end
  def edit
  end

  def create
    @course = Course.new(course_params)

      if @course.save
        flash[:success] = "Course successfully added!"
        redirect_to :back
      else
        flash[:danger] = "Ooops!"
        redirect_to :back
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    flash[:danger] = "Course abolished!"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name)
    end
end
