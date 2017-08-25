class RegistrationsController < Devise::RegistrationsController
include Devise::Controllers::Helpers
  before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
  skip_before_action :require_no_authentication
  respond_to :html, :json
  
   def teacher
     build_resource({})
     self.resource.teachers.build
     respond_with self.resource
   end
    
   def student
     build_resource({})
     self.resource.students.build
     respond_with self.resource
   end  
  def new
    build_resource({})
    self.resource.students.build
    self.resource.teachers.build
    respond_with self.resource
  end  
  
  def role
  end
  
  def create
   super
  end
  
  def update
    super
  end
  
  def edit
    super
  end
  
  private
    def redirect_unless_admin
      unless current_user.has_role? :admin
        flash[:error] = "You are not authorized to perform this action."
        redirect_to root_path
      end
    end

    def sign_up(resource_name, resource)
      true
    end
    
    
    def account_update(resource_name, resource)
      true
    end
    
    def sign_up_params
      allow = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,
        :gender, :birthday, :contact_number, :avatar, students_attributes: [:user_id, :course_id, :year_level, :block_id, :department_id],
        teachers_attributes: [:user_id, :department_id, :block_id, :status], roles: [] ]
      params.require(resource_name).permit(allow)
    end
  
    
    def account_update_params
      allow = [:id, :username, :email, :password, :password_confirmation, :current_password, :first_name, :last_name,
        :gender, :birthday, :contact_number, :avatar]
      params.require(resource_name).permit(allow)
    end
end
