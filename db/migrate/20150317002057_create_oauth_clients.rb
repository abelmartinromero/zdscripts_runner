class CreateOauthClients < ActiveRecord::Migration
  def change
    create_table :oauth_clients do |t|
      t.string :token
      t.string :subdomain
      t.integer :user_id	
      t.timestamps
    end
  end
end
