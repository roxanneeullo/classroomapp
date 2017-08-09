class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.integer :activity_id
      t.integer :student_id
      t.integer :teacher_id
      t.integer :score

      t.timestamps
    end
  end
end
