class AddActivityIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :activity_id, :integer
  end
end
