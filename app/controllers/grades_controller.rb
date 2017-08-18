class GradesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @grades = Grade.all
    @grade = Grade.new
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
   #  @grade = Grade.find(params[:id])
     @student = Student.where(user_id: params[:user_id]).first
    # @grades = Grade.where(section_id:, student_id: params[:section_id, :student_id])
     
     @grades = Grade.where(params[:section_id] ? {section_id: params[:section_id]} : "section_id IS NOT NULL")
            .where(params[@student.id] ? {student_id: params[@student.id]} : "student_id IS NOT NULL")
  end

  # GET /courses/1/edit
  def edit
  end
  
  def new
    @grade = Grade.new
    @activities = Activity.all
    @teacher = Teacher.where(user_id: params[:user_id]).first
    @section = Section.find(params[:section_id])
    @student = Student.find(params[:id])
    @activity = Activity.new
  end

  # POST /courses
  # POST /courses.json
  def create
    @grade = Grade.create(grade_params)
      if @grade.save
        flash[:success] = "Grade was successfully posted!"
        redirect_to :back
      else
        flash[:danger] = "Ooops!"
        redirect_to :back
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @grade.destroy
    flash[:danger] = "Grade deleted!"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.where(section_id: params[:section_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:activity_id, :section_id, :student_id, :teacher_id, :score)
    end
end
