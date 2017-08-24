class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /students
  # GET /students.json
  def index
    @students = Student.paginate(page: params[:page], per_page: 10)
  end

  
  def show
  
  end
  
  def subject
      @student = Student.where(user_id: params[:user_id]).first
  end

  def schedule
      @student = Student.where(user_id: params[:user_id]).first
  end
  
  def grade
    @student = Student.where(user_id: params[:user_id]).first
  end
  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.where(user_id: params[:user_id]).first
    end
 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:user_id, :course_id, :year_level, :block_id, :department_id)
    end
end
