require 'sinatra/base'
#this inside the sinatra gem
require 'mongoid'
#this refers to the mongoid gem

require_relative 'post'
require_relative 'group'
require_relative 'user'

class Collaborator < Sinatra::Base
  #this class is a controller
  #this is the app too! - because it is inheriting from Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '../views')
  set :public_folder, File.join(File.dirname(__FILE__), '../public')

  Mongoid.load!(File.join(File.dirname(__FILE__),'mongoid.yml'))

  get '/mock-groupname' do
    erb :post_form
  end

  
  get '/login' do
    erb :login_form
  #check if the key - value pair exists in mongo and if so allow entry
  end

  get '/group/create' do
    erb :create_group
  end

  post '/groups' do
    Group.create(:name => params['add_group'])
    redirect '/list-of-groups'

  end

  get '/groups' do
    erb(:list_of_groups, locals: { :groups => Group.all })
  end

  post '/mock-groupname' do 
    erb :post_id1, locals: { :post => Post.create(:content => params['message']) }
  end

  get '/groups/:group_name' do |group_name|
    erb :group_timeline, locals: { :posts => Post.all }
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0
  # really not sure what this is for (Matt)
end

