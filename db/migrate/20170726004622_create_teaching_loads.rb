class CreateTeachingLoads < ActiveRecord::Migration[5.0]
  def change
    create_table :teaching_loads do |t|
      t.integer :teacher_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
