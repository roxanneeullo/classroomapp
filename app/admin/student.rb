ActiveAdmin.register Student do
   permit_params :course_id, :user_id, :block_id, :year_level, :department_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  id_column
  column :user_id
  column :course_id
  column :year_level
  
  actions
end

form do |f|
  f.inputs do
    f.input :user_id
    f.input :department
    f.input :course
    f.input :year_level
    f.input :block
    f.input :created_at
    f.input :updated_at
    
   
  end
  f.actions
end


end