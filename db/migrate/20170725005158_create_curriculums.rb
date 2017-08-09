class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.integer :course_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
