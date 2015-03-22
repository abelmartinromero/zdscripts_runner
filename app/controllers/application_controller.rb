class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :authenticate_user
	helper_method :logged_in?
	

	protected 
	def authenticate_user
		if session[:user_id]

		@current_user = User.find session[:user_id] 
	 	return true	
	else
		redirect_to(:controller => 'auth', :action => 'login')
		return false
	end
	end
	def save_login_state
		if session[:user_id]
			redirect_to(:controller => 'pages', :action => 'home')
			return false
		else
			return true
		end
	end
	def logged_in?
       @current_user != nil
    end
end
