class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
     @student = Student.where(user_id: params[:user_id]).first
     @teacher = Teacher.where(user_id: params[:user_id]).first
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :gender, :birthday, :contact_number, 
        :email, :avatar, :teacher_id, :student_id)
    end
end
