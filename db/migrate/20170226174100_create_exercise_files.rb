class CreateExerciseFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_files do |t|
      t.text :content
      t.references :exercise, foreign_key: true
      t.string :file_type

      t.timestamps
    end
  end
end
