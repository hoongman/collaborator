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
  enable :sessions
  
  Mongoid.load!(File.join(File.dirname(__FILE__),'mongoid.yml'))

# +=+=+=+ for SIGN UP module +=+=+=+ #
  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.create!(:username => params['username'], :password => params['password'])
    redirect '/groups'
  end

  # +=+=+=+ for LOGIN module +=+=+=+ #

  get '/' do
    erb :login_form # check if the KV pair exists in mongoDB and if so, allow entry
  end

  post '/login' do
    user = User.first({:conditions=>{:username=>params['username']}})

    if user.nil?
      redirect '/'
    elsif user.password == params['password']
      session[:user] = user._id
      redirect '/groups'
    else
      redirect '/'
    end
  end

  # +=+=+=+ for GROUP module +=+=+=+ #

  get '/group/create' do

    erb :create_group
  end

  get '/groups/:group_url' do |group_url|
    group = Group.first(conditions: { :url => group_url})
    erb :group_timeline, locals: { :posts =>  group.posts.order_by([:created_at, :desc]), :group_name => group.group_name }
  end 

  post '/groups/:group_url' do |group_url|
    group = Group.find_or_create_by(url: group_url)
    group.posts.create(:content  => params['message'])
    redirect '/groups/' + group_url
  end

  post '/groups' do
    Group.create(:group_name => params['add_group'], :url => params['add_group'].gsub(' ', "_"))
    redirect '/groups'
  end

  get '/groups' do
    erb(:list_of_groups, locals: { :groups => Group.all })
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  # really not sure what this is for (Matt)
end

