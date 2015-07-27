class DoortagController < ApplicationController
	def search
		doortags = Doortag.where(:tag => params[:tag]).first
		if doortags != nil
			@tags = doortags.sweets
		end
	end
end
