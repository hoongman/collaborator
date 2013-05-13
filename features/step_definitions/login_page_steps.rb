Given(/^a user exists with the following username and password$/) do |login|
	
	login.hashes.each do |user|
		User.create(username: user['username'], password: user['password'])
	end
end

Then(/^I should see a list of all the groups$/) do
  page.should have_content('List of groups')
end
