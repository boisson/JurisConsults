class CreateProtesteAuthUsers < ActiveRecord::Migration
  def change
    create_table :proteste_auth_users do |t|
      t.string :uid
      t.text :info

      t.timestamps
    end
  end
end
