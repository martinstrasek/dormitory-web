class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.User :references
      t.string :token
      t.string :secret
      t.string :username

      t.timestamps
    end
  end
end
