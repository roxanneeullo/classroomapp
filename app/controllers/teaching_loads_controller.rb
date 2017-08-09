class TeachingLoadsController < ApplicationController
    load_and_authorize_resource
  
    def index
      @teaching_loads = TeachingLoad.all
      @teaching_load = TeachingLoad.new
    end

    # GET /courses/1
    # GET /courses/1.json
    def show
       @teaching_load = TeachingLoad.find(params[:id])
    end

    # GET /courses/1/edit
    def edit
    end

    # POST /courses
    # POST /courses.json
    def create
      @teaching_load = TeachingLoad.create(teaching_load_params)
        if @teaching_load.save
          flash[:success] = " Teaching Load was successfully added!"
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
        if @teaching_load.update(teaching_load_params)
          format.html { redirect_to @teaching_load, notice: 'Load was successfully updated.' }
          format.json { render :show, status: :ok, location: @teaching_load }
        else
          format.html { render :edit }
          format.json { render json: @teaching_load.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /courses/1
    # DELETE /courses/1.json
    def destroy
      @teaching_load.destroy
      flash[:danger] = "Load removed!"
      redirect_to :back 
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_teaching_load
        @teaching_load = TeachingLoad.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def teaching_load_params
        params.require(:teaching_load).permit(:teacher_id, :subject_id)
      end
  
  
end
