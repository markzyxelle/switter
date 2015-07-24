class Status < ActiveRecord::Base
	belongs_to :sweet
	belongs_to :user
end
