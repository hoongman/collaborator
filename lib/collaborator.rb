require 'sinatra/base'
#this inside the sinatra gem
require 'mongoid'
#this refers to the mongoid gem

  #ENV["RACK_ENV"] = "production"

class Collaborator < Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '../views')

  Mongoid.load!(File.join(File.dirname(__FILE__),"mongoid.yml"))

  get '/' do
    'Hello Collaborator!'
  end

  get '/mock-groupname' do
    erb :post_form
  end
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> afa32c2bda2d84a442a923a8e3fde89bd1de1e27
  
  get '/group-timeline' do
    erb :group_timeline
  end 
 
  post '/mock-groupname' do
    erb :post_id1
  end

<<<<<<< HEAD
>>>>>>> matt/master
=======
>>>>>>> afa32c2bda2d84a442a923a8e3fde89bd1de1e27
  # start the server if ruby file executed directly
  run! if app_file == $0
end

