class BlocksController < ApplicationController
  load_and_authorize_resource
  
  def index
    @blocks = Block.paginate(page: params[:page], per_page: 10)
    @block = Block.new
    @departments = Department.all
  end
  
  def show
  end

  def edit
  end

  def create
    @block = Block.create(block_params)
    if @block.save
      flash[:success] = "Block was successfully created!"
      redirect_to :back
    else
      flash[:danger] = "Ooops!"
      redirect_to :back
    end
  end

  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { render :show, status: :ok, location: @block }
      else
        format.html { render :edit }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @block.destroy
    flash[:danger] = "Block successfully abolished!"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:name, :teacher_id, :department_id)
    end
end
