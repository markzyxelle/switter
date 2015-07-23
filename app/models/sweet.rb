class Sweet < ActiveRecord::Base
	validates :message, length: { minimum: 1, maximum: 140 }
end
