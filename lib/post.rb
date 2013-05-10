class Post
  include Mongoid::Document
#  field :message, type: String
  belongs_to :group
  field :content, type: String

  #def content
  #	whatever content is in the database for this record
  #end
end
