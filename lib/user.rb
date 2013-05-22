class User 
	include Mongoid::Document

	field :username, type: String
	field :password, type: String
	field :epassword, type: String
	field :salt, type: String

	field :firstname, type: String
	field :lastname, type: String
	field :description, type: String
	field :email, type: String


# this might not be right- what is the right syntax for the above?

end
