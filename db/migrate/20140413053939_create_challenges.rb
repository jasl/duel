class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :repository_id, null: false
      t.integer :favorers_count, default: 0
      t.integer :objectors_count, default: 0
      t.references :user, index: true
      t.references :subject, index: true

      t.timestamps
    end
  end
end
