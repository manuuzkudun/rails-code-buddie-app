class CreateWorkSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :work_spaces do |t|
      t.string :name
      t.string :session_id
      t.references :exercise, foreign_key: true
      t.references :user, foreign_key: true
      t.references :language, foreign_key: true
      t.text :user_code

      t.timestamps
    end
  end
end
