
require 'collaborator'
require 'rspec'
require 'rack/test' # rack is a specification close to the TCP/IP protocol. rack test is a set of testing helpers allowing test of web applications

describe Collaborator do #describing the Collaborator class
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

	xit 'returns all the groups in the database' do
		Group.should_receive(:all)

		get '/groups'
	end


  it 'creates a new group' do
    Group.should_receive(:create).with({:group_name => 'testgroup'})
    post '/groups', {'add_group' => 'testgroup'}
  end

 # tells it to only return the group name on the page we are interested in (list of groups)
	
	#context 'creating a new post' do
	#	it 'saves a new post' do
	#		Group.should_receive(:create).with(message: 'Hey test')
	#		post '/mock-groupname', { :message => 'Hey test' }
	#	end
	#end

  	xit 'creates a new group' do
    	Group.should_receive(:create).with({:name => 'testgroup'})
    
    	post '/groups', {'add_group' => 'testgroup'}
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
