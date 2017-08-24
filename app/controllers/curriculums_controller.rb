class CurriculumsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @curriculums = Curriculum.paginate(page: params[:page], per_page: 10)
    @curriculum = Curriculum.new
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
     @curriculum = Curriculum.find(params[:id])
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    #params[:review][:subject_ids].delete("")
    @curriculum = Curriculum.new(curriculum_params)
   
      if @curriculum.save
        flash[:success] = "Subject successfully added to course!"
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
      if @curriculum.update(curriculum_params)
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @curriculum.destroy
    flash[:danger] = "Subject removed from Course!"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_params
      params.require(:curriculum).permit(:course_id, :subject_id )
    end
    
    def clean_select_multiple_params hash = params
      hash.each do |k, v|
        case v
        when Array then v.reject!(&:blank?)
        when Hash then clean_select_multiple_params(v)
        end
      end
    end
end
