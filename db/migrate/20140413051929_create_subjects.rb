class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.string :objective, null: false
      t.text :description
      t.string :accept_token, null: false
      t.references :user, index: true

      t.timestamps
    end

    add_index :subjects, :accept_token, unique: true
  end
end
