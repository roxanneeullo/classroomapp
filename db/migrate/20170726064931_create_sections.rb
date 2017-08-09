class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.string :semester
      t.string :schedule
      t.integer :subject_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
