class AddSectionIdToGrades < ActiveRecord::Migration[5.0]
  def change
    add_column :grades, :section_id, :integer
  end
end
