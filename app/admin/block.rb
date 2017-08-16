ActiveAdmin.register Block do
  permit_params :name, :department_id

  index do
    selectable_column
    id_column
    column :name
    column :department
    
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :department
      f.input :created_at
      f.input :updated_at
    
   
    end
    f.actions
  end


end
