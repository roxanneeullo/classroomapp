class AddBlockIdToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :block_id, :integer
  end
end
