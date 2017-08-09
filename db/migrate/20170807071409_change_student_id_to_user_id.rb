class ChangeStudentIdToUserId < ActiveRecord::Migration[5.0]
  def change
     rename_column :comments, :student_id, :user_id
  end
end
