require 'collaborator'
require 'rspec'
require 'rack/test'

describe Collaborator do
	include Rack::Test::Methods

	def app
		Collaborator
	end

	it 'sending a request to /' do
		get '/'

		last_response.body.should eq 'Hey there'
	end

	it 'post a new message' do
		Post.should_receive(:create).with(content: 'Hello Collaborators!')
		post '/mock-groupname', {"message"=>"Hello Collaborators!"}
	end
end
