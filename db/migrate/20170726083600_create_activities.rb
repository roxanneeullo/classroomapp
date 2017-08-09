class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :type
      t.string :content
      t.integer :section_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
