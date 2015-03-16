class AuthController < ApplicationController
	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]
	before_filter :authenticate_user, :only =>[:logout]

	 def login
    if session[:user_id] != nil
      redirect_to '/home'
    end
  end
	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			redirect_to('/home')
		else
			flash[:notice] = "Invalid Username or Password"
			render "login"	
		end
	end

	def logout
		session[:user_id] = nil
		flash[:notice] = "GoodBye! Come back soon!"
		redirect_to :action => 'login'

	end
end
