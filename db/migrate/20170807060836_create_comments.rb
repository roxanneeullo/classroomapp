class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :context
      t.integer :section_id
      t.integer :student_id

      t.timestamps
    end
  end
end
