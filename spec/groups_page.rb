require 'collaborator'
require 'rspec'
require 'rack/test' # rack is a specification close to the TCP/IP protocol. rack test is a set of testing helpers allowing test of web applications

describe 'post_message' do 
  include Rack::Test::Methods  # importing methods to test as if was a web applciation. see the sinatra documentation for info on rack tests.

  def app
    Collaborator
  end

  xit 'returns all the groups in the database' do
    Group.should_receive(:all)
    get '/groups'
  end
end

 # tells it to only return the group name on the page we are interested in (list of groups)
  

# +=+=+=+ Tap up Vince or Charlie regards the above tests +=+=+=+ #