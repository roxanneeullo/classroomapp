class ClassListsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @class_lists = ClassList.paginate(page: params[:page], per_page: 10)
    @class_list = ClassList.new
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @class_list = ClassList.create(class_list_params)
      if @class_list.save
        flash[:success] = "Student successfully added to Class!"
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
      if @class_list.update(class_list_params)
        format.html { redirect_to @class_list, notice: 'ClassList was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_list }
      else
        format.html { render :edit }
        format.json { render json: @class_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @class_list.destroy
    flash[:danger] = "Student removed from class!"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_list
      @class_list = ClassList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_list_params
      params.require(:class_list).permit(:student_id, :section_id)
    end
end
