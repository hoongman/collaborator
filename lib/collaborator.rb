require 'sinatra/base'
#this inside the sinatra gem
require 'mongoid'
#this refers to the mongoid gem

require_relative 'post'
require_relative 'group'

class Collaborator < Sinatra::Base
  #this class is a controller
  #this is the app too! - because it is inheriting from Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), '../views')
  Mongoid.load!(File.join(File.dirname(__FILE__),"mongoid.yml"))

  set :group, Group.create(:group_name => "master_group" )


  get '/' do
    'Hey there'
  end

  get '/mock-groupname' do
    erb :post_form
  end
  
  get '/list-of-groups' do
    erb :list_of_groups, locals: { :groups => Group.all }
  end

  post '/mock-groupname' do 
    erb :post_id1, locals: { :post => settings.group.posts.create(:content => params['message'])}
  end

  get '/groups/:name' do |name|
    erb :group_timeline, locals: { :group => Group.first(conditions: {group_name: name}) }
  end


  # start the server if ruby file executed directly
  # really not sure what this is for (Matt)
  run! if app_file == $0
end

