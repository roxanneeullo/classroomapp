class AddDepartmentIDtoBlocks < ActiveRecord::Migration[5.0]
  def change
    add_column :blocks, :department_id, :integer
  end
end
