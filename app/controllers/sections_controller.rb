class SectionsController < ApplicationController
  load_and_authorize_resource
  def index
    @sections = Section.all
    @section = Section.new
  end
  
  def show
     @student = Student.where(user_id: params[:user_id]).first
  end
  
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "Section was successfully created!"
      redirect_to :back
    else
      flash[:danger] = "Ooops!"
      redirect_to :back    
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to :back, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @section.destroy
    flash[:danger] = "Section abolished!"
    redirect_to :back 
  end
  
  private
      # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end
    
# Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :semester, :schedule, :teacher_id, :subject_id, teaching_loads_attributes: [:teacher_id, :subject_id])
    end
  
end
