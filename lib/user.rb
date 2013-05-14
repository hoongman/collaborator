class User 
	include Mongoid::Document

	field :username, type: String
	field :password, type: String

# this might not be right- what is the right syntax for the above?

end
