class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @subjects = Subject.paginate(page: params[:page], per_page: 10)
    @subject = Subject.new
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    # @subject = Subject.find(params[:id])
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @subject = Subject.create(subject_params)
    if @subject.save
      flash[:success] = "Subject was successfully added!"
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
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @subject.destroy
    flash[:danger] = "Subject abolished!"
    redirect_to :back    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
