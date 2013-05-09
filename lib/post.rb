class Post

  include Mongoid::Document

  field :message, type: String
  
end