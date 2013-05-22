require 'sinatra/base'
require 'mongoid'
require 'CarrierWave/mongoid'
require_relative 'post'
require_relative 'group'
require_relative 'user'

class Collaborator < Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '../views')
  set :public_folder, File.join(File.dirname(__FILE__), '../public')
  enable :sessions
  Mongoid.load!(File.join(File.dirname(__FILE__),'mongoid.yml'))

helpers do
  def current_user
    User.find(session[:user])
  rescue Exception
    nil
  end

  def admin_user
    User.find(session[:user]).username == 'admin'
  rescue Exception
    nil
  end

  # generate salt
  def salt
    Digest::SHA2.hexdigest(Random.new_seed.to_s)
  end

  # pass through SHA2
  def encrypt(password, salt)
    Digest::SHA2.hexdigest(password + salt)
  end
end

before '/group*' do
  redirect '/' unless current_user
end

before '/admin*' do
  redirect '/' unless admin_user
end

# +=+=+=+ for ADMIN module +=+=+=+ #
  get '/admin/profiles' do
    users = User.all
    erb :profiles, locals: {:users => users}
  end

# +=+=+=+ for SIGN UP module +=+=+=+ #
  post '/sign_up' do
    current_salt = salt
    user = User.create!(:username => params['username'],
                        :password => params['password'],
                        :salt => current_salt,
                        :epassword => encrypt(params['password'],current_salt.to_s))
    session[:user] = user._id
    redirect "/groups"
  end

  # +=+=+=+ for LOGIN module +=+=+=+ #
  get '/' do
    erb :login_form
  end

  post '/login' do
    user = User.first({:conditions=>{:username=>params['username']}})
    if user.nil?
      redirect '/'
    elsif (encrypt(params['password'],user.salt.to_s)) == (user.epassword.to_s)
      session[:user] = user._id
      redirect '/groups'
    else
      redirect '/'
    end
  end

# +=+=+=+ for LOGOUT module +=+=+=+ #
  get '/logout' do
    session[:user] = nil
    redirect '/goodbye'
  end

  get '/goodbye' do
    erb :goodbye
  end

  # +=+=+=+ for GROUP module +=+=+=+ #
  get '/group/create' do
    erb :create_group
  end

  get '/groups/:group_url' do |group_url|
    group = Group.first(conditions: { :url => group_url})
    erb :group_timeline, locals: { :posts =>  group.posts.order_by([:created_at, :desc]), :group => group }
  end

  post '/groups/:group_url' do |group_url|
    group = Group.find_or_create_by(url: group_url)
    post = group.posts.create(:content  => params['message'])
    post.to_json
  end

  post '/groups' do ()
    Group.create(:group_name => params['add_group'], :url => params['add_group'].gsub(' ', "_"))
    redirect '/groups'
  end

  get '/groups' do
    erb(:list_of_groups, locals: { :groups => Group.all })
  end

  post '/groups/:group_url/delete_post' do  |group_url|
    posts = Post.find(params['post_id'])
    posts.delete
    redirect '/groups/' + group_url
  end

  post '/groups/:group_url/delete_group' do  |group_url|
    group = Group.find(params['group_id'])
    
    if group.posts.empty?
      group.delete
      redirect '/groups'
    else
      redirect "/groups/#{group_url}/confirm_delete"
    end
  end

  post '/groups/:group_url/delete_confirmed' do  |group_url|
    group = Group.where(group_name: group_url)
      group.delete
      redirect '/groups'
  end

  get '/groups/:group_url/confirm_delete' do |group_url|
    group = Group.find_or_create_by(group_name: group_url)
    erb :confirm_delete_group, locals: { :group => group }
  end

# +=+=+=+ for PROFILES module +=+=+=+ #
  get '/profiles/create' do
    erb :profile_create, locals: { :user => params['username']}
  end
  
  post '/profiles/create' do
    user = User.create!(:username => params['username'],
                        :password => params['password'],
                        :firstname => params['firstname'],                
                        :lastname => params['lastname'],
                        :email => params['email'],
                        :description => params['description'])
    session[:user] = user._id
    user =  current_user.username
    redirect '/groups'
  end

  get '/profiles/:user' do |user|
    redirect '/' unless ((current_user.username == 'admin') || (current_user.username == user))
    cur_user = User.first(conditions: { :username => user})
    erb :profile_page, locals: { :user => cur_user }
  end
  
  post '/profiles/:user' do |user|
      cur_user = User.first(conditions: { :username => user})
      cur_user.update_attributes!(:username => params['username'],
                        :password => params['password'],
                        :firstname => params['firstname'],                
                        :lastname => params['lastname'],
                        :email => params['email'],
                        :description => params['description'])
    redirect "/profiles/#{user}"
  end

# +=+=+=+ for UPLOAD module +=+=+=+ #

  get '/upload' do 
    @uploads = Upload.all 
    erb :index
  end

  post '/upload' do 
    upload = Upload.new
    upload.file = params[:image]
    upload.save
    redirect to('/upload')
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
  # really not sure what this is for (Matt)
end

class MyUploader < CarrierWave::Uploader::Base
  storage :file
end


