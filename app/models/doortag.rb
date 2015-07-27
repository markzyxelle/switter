class Doortag < ActiveRecord::Base
	has_and_belongs_to_many :sweets, :join_table => "sweets_doortags"
end
