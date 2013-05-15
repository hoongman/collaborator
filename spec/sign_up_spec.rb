require 'collaborator'
require 'rspec'
require 'rack/test' 

describe 'sign_up' do 
  include Rack::Test::Methods

  def app
  	Collaborator
  end
  #no idea what this is for

  it 'creates a new user' do
   User.should_receive(:create!).with({:username => 'matt', :password => 'Elephant'})
   post '/sign_up', {'username' => 'matt', 'password' => 'Elephant'}   
  end

  it 'creates a new group' do
    Group.should_receive(:create).with({:group_name => 'testgroup'})
    post '/groups', {'add_group' => 'testgroup'}
  end

end


# +=+=+=+ Tap up Keir or Matt regards the above tests +=+=+=+ #
	
