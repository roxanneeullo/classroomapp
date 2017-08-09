class AddBlockIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :block_id, :integer
  end
end
