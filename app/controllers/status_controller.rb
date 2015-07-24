class StatusController < ApplicationController
  def toggle_sweet
  	@temp=Status.where(user_id: session[:user_id], sweet_id: params[:id]).first()
	if @temp !=nil
		if @temp.comment == true
			@temp.destroy
		else
			@temp.comment = 1
			@temp.save
		end
	else
	    Status.create(user_id: session[:user_id], sweet_id: params[:id], comment: 1)
	end
	redirect_to(:controller => "sweets", :action => "index")
  end

  def toggle_sour
  	@temp=Status.where(user_id: session[:user_id], sweet_id: params[:id]).first()
	if @temp !=nil
		if @temp.comment == false
			@temp.destroy
		else
			@temp.comment = 0
			@temp.save
		end
	else
	    Status.create(user_id: session[:user_id], sweet_id: params[:id], comment: 0)
	end
	redirect_to(:controller => "sweets", :action => "index")
  end
end