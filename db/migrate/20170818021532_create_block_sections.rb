class CreateBlockSections < ActiveRecord::Migration[5.0]
  def change
    create_table :block_sections do |t|
      t.integer :section_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
