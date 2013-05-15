require 'collaborator'
require 'rspec'
require 'rack/test' # rack is a specification close to the TCP/IP protocol. rack test is a set of testing helpers allowing test of web applications

describe 'login' do 
  include Rack::Test::Methods  # importing methods to test as if was a web applciation. see the sinatra documentation for info on rack tests.

  def app
    Collaborator
  end

  it 'logs a user in' do
      user = double User, password: 'secret'
      User.should_receive(:first).with(conditions: {:username => 'Fred'}).and_return(user)

      post '/login', {'username' => 'Fred', 'password' => 'secret'}
  end

  it 'no user found' do
    User.should_receive(:first).with(conditions: {:username => 'Fred'}).and_return(nil)

    post '/login', {'username' => 'Fred', 'password' => 'secret'}
  end
end

# +=+=+=+ Tap up Steve or Keir regards the above tests +=+=+=+ #