class Post
  include Mongoid::Document
  field :message, type: String
  belongs_to :group 
end