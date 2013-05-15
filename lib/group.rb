class Group
	include Mongoid::Document
	field :group_name, type: String
	field :url, type: String
	has_many :posts
end