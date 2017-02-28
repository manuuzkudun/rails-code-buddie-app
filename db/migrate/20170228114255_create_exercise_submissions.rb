class CreateExerciseSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_submissions do |t|
      t.references :user, foreign_key: true
      t.references :exercise, foreign_key: true
      t.boolean :completed, default: false
      t.text :answer

      t.timestamps
    end
  end
end
