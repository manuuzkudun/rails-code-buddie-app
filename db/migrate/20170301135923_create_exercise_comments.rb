class CreateExerciseComments < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
