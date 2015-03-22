class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :subdomain
      t.string :token
      t.string :email
      t.integer :user_id
      t.timestamps
    end
  end
end
