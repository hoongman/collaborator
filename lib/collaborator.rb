require 'sinatra/base'
#this inside the sinatra gem
require 'mongoid'
#this refers to the mongoid gem

class Post
  include Mongoid::Document
  field :content, type: String
end

require_relative 'post'
require_relative 'group'

class Collaborator < Sinatra::Base
  #this class is a controller
  #this is the app too! - because it is inheriting from Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '../views')
  Mongoid.load!(File.join(File.dirname(__FILE__),"mongoid.yml"))

  get '/' do
    'Hey there'
  end

  get '/mock-groupname' do
    erb :post_form
  end

  get '/group/create' do
    erb :create_group
  end

  post '/list-of-groups' do
    Group.create(:name => params['add_group'])
    erb :list_of_groups, locals: { :groups => Group.all }
  end

  get '/list-of-groups' do
    erb :list_of_groups, locals: { :groups => Group.all }
  end

  post '/mock-groupname' do 
    erb :post_id1, locals: { :post => Post.create(:content => params['message']) }
  end

  get '/group-timeline' do
    erb :group_timeline, locals: { :posts => Post.all }
  end 

  # start the server if ruby file executed directly
  # really not sure what this is for (Matt)
  run! if app_file == $0
end

