class RemoveSectionIdFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :section_id, :integer
  end
end
