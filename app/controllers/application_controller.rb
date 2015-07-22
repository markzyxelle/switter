class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def check_auth
  	unless session[:user_id]
  		flash[:notice] = "Please log in"
  		redirect_to(:controller => 'users', :action => 'index')
  		return false
  	else
  		return true
  	end
  end
end
