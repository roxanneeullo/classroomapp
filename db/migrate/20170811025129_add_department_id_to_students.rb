class AddDepartmentIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :department_id, :integer
  end
end
