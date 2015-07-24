class Sweet < ActiveRecord::Base
	validates :message, length: { minimum: 1, maximum: 140 }
	has_many :statuses
	has_many :users, :through => :statuses
end
