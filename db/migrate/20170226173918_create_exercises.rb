class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :title
      t.references :language, foreign_key: true
      t.string :description
      t.text :instruction

      t.timestamps
    end
  end
end
