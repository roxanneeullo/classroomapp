ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :username, :first_name, :last_name, :gender, :birthday, :contact_number, :roles_mask

  index do
    selectable_column
    id_column
    column :email
    column :username
    column :first_name
    column :last_name
    column :gender
    column :birthday
    column :contact_number
    column :roles_mask
    
    actions
  end

  filter :email
  filter :username
  filter :roles_mask
  filter :first_name
  filter :last_name

  form do |f|
    f.inputs do
      f.input :email
      f.input :username
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :gender
      f.input :birthday
      f.input :contact_number
      f.input :roles_mask
    end
    f.actions
  end

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
    
  end
  
end
