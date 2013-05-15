require 'collaborator'
require 'rspec'
require 'rack/test' # rack is a specification close to the TCP/IP protocol. rack test is a set of testing helpers allowing test of web applications

describe 'post_message' do 
  include Rack::Test::Methods  # importing methods to test as if was a web applciation. see the sinatra documentation for info on rack tests.

  def app
    Collaborator
  end

  xit 'post a new message' do
    posts = double :posts, :create => ''
    group = double :group, :posts => posts
    Group.should_receive(:find_or_create_by).with({group_name: 'master_group'}).and_return(group)
    post '/mock-groupname', {'message'=>'Hello Collaborators!'}
  end

  xit 'post a new message' do
    Post.should_receive(:create).with(content: 'Hello Collaborators!')
    post '/mock-groupname', {"message"=>"Hello Collaborators!"}

  end
end

# +=+=+=+ Tap up XXXX or XXXX regards the above tests +=+=+=+ #