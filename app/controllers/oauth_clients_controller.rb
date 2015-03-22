class OauthClientsController < ApplicationController

	before_filter :authenticate_user

	def index
		@page_title ="Websites"
		@currentuser = User.find_by_id(session[:user_id])
		@oauthclients = OauthClient.where(@currentuser.id)
	end

	def unlink
		#todo
	end


end
