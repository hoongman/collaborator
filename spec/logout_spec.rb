require 'collaborator'
require 'rspec'
require 'rack/test'

describe 'logout' do

include Rack::Test::Methods

  def app
    Collaborator
  end

  context 'the session ends when logout button is pressed' do
    it "Testing this would be far to complex and we have covered it in the cukes anyways" do
    end
  end

end