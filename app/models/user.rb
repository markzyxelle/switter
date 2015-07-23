class User < ActiveRecord::Base
	has_secure_password
	validates :username, length: { in: 8..25 }
	validates :password, length: { minimum: 6 }
end