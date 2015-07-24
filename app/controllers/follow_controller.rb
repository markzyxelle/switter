class FollowController < ApplicationController
	def follow
	    @temp=Follow.where(follower_id: session[:user_id], following_id: params[:id]).first()
	    if @temp !=nil
	       @temp.destroy
	    else
	        Follow.create(follower_id: session[:user_id], following_id: params[:id])
	    end

	    redirect_to(:controller => "users", :action => "list")
	end
end
