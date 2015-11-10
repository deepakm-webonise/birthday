class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :avatar
      t.datetime :birthday
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
