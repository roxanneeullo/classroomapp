class ChangeTypetoActivityType < ActiveRecord::Migration[5.0]
  def change
    rename_column :Activities, :type, :activity_type
    
  end
end
