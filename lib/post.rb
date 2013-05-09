class Post
	include Mongoid::Document
	
	def post
	field :message, type: string
	end
end