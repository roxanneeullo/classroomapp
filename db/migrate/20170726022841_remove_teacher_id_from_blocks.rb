class RemoveTeacherIdFromBlocks < ActiveRecord::Migration[5.0]
  def change
    remove_column :blocks, :teacher_id, :integer
  end
end
