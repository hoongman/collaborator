Given(/^a user exists with the following username and password$/) do |login|
	
	login.hashes.each do |user|
		User.create(username: user['username'], password: user['password'])
	end
end

When(/^I login with my username and password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be sent to the welcome page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^if I enter unmatched or unknown login details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be sent to an unsuccessful login page$/) do
  pending # express the regexp above with the code you wish you had
end
