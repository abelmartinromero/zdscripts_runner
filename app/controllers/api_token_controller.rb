class ApiTokenController < ApplicationController
	require 'zendesk_api'
	def index 
		@page_title = "Api Tokens"
		@currentuser = User.find_by_id(session[:user_id])
		@clients = ApiToken.where(@currentuser.id)
	end

	def new
		
	end

	def create
		verify_credentials(params)

	#	@token = ApiToken.new(params[:token])
	#	respond_to do |format|
	#      if @token.save
	#       redirect_to @token, notice: 'Item was successfully created.' 
	#      else
	#		render action: "new" 
	#      end
    end


	def verify_credentials
		client = ZendeskAPI::Client.new do |config|
	  	config.url = "https://"+params[:subdomain] + ".zendesk.com" # e.g. https://mydesk.zendesk.com/api/v2
	  	config.username = params[:email]
	    config.token = "your zendesk token"
	  	config.retry = true
	  	require 'logger'
	  	config.logger = Logger.new(STDOUT)
	  	config.client_options = { :ssl => false }
		end
		client.tickets.create(:subject => "Test Ticket", :comment => { :value => "This is a test" }, :submitter_id => client.current_user.id, :priority => "urgent")
		render "new"
	end
	
end
