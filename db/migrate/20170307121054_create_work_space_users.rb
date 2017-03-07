class CreateWorkSpaceUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :work_space_users do |t|
      t.references :user, foreign_key: true
      t.references :work_space, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
