class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.integer :user_id
      t.integer :department_id
      t.string :status

      t.timestamps
    end
  end
end
