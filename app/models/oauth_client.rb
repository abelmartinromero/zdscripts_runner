class OauthClient < ActiveRecord::Base
	belongs_to :user, foreign_key: "users_id"

	
end
