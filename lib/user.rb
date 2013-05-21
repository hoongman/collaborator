class User 
	include Mongoid::Document

	field :username, type: String
	field :password, type: String

	field :dob, type: String
	field :sex, type: String
	field :description, type: String
	field :photo, type: String


# this might not be right- what is the right syntax for the above?

end
