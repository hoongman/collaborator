require 'collaborator'
require 'rspec'
require 'rack/test' 

describe 'delete a post' do 
	  include Rack::Test::Methods

  def app
  	Collaborator

  end

	it 'deletes a post' do
			current_user = true
			posts = double :post
			Post.should_receive(:where).and_return(posts)			
			posts.should_receive(:delete)

			post '/groups/test_group/delete_post'
	end
end


#    User.should_receive(:create!).with({:username => 'matt', :password => 'Elephant'})