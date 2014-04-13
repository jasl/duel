class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :refresh_token
      t.integer :expires_at

      t.timestamps
    end
  end
end
