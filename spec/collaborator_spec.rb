require 'collaborator'
require 'rspec'
require 'rack/test' #this is a set of testing helpers that allow use to test rack based applications

describe Collaborator do
		include Rack::Test::Methods #importing test methods to use in rspec

		def app #rack uses this to know the name of the controller Class
			Collaborator #name of the Class - not the file
		end

		it 'greets us' do 
			get '/' #sends a get request to Sinatra

			last_response.body.should eq 'Hello Collaborator!' #expects a response from Sinatra
		end

		context 'creating a new post' do #groups tests that fit together
			it 'saves a new post' do 
				Post.should_receive(:create).with(message: 'Hey test')
			# a class post will receive a method create with message 'Hey test'
				post '/mock-groupname', { :message => 'Hey test'}
			end
		end
end



