class CreateOauthClients < ActiveRecord::Migration
  def change
    create_table :oauth_clients do |t|
      t.token :string
      t.subdomain :string
      t.user_id :integer	
      t.timestamps
    end
  end
end
