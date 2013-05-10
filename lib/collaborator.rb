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
  set :public_folder, File.join(File.dirname(__FILE__), '../public')
 
  Mongoid.load!(File.join(File.dirname(__FILE__),'mongoid.yml'))

  get '/group/create' do
    erb :create_group
  end

  post '/groups' do
    Group.create(:group_name => params['add_group'])
    redirect '/list-of-groups'
  end

  get '/groups' do
    erb(:list_of_groups, locals: { :groups => Group.all })
  end

  get '/mock-groupname' do
    erb :post_form
  end

  post '/mock-groupname' do
    group = Group.find_or_create_by(group_name: 'master_group')
    erb :post_id1, locals: { :post => group.posts.create(:content  => params['message']) }
  end

  get '/groups/:group_name' do |group_name|

    erb :group_timeline, locals: { :posts => Post.all }
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0
  # really not sure what this is for (Matt)
end

