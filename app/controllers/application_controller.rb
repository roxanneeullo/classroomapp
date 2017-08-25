class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  respond_to :html, :xml, :json, :js
  before_action :set_locale
 
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
      I18n.locale = I18n.available_locales.include?(locale) ?
        locale :
        I18n.default_locale
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end
   protected

   def configure_permitted_parameters
     added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,
        :gender, :birthday, :contact_number, students_attributes: [:user_id, :course_id, :year_level, :department_id], 
        teachers_attributes: [:user_id, :department_id, :status, :block_id],roles: [] ]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
   end
   
  private
  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.has_role? :admin
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
    
  def after_sign_in_path_for(resource_or_scope)
    if current_user.has_role? :admin
      admin_dashboard_path
    else
      root_path
    end
  end
end
