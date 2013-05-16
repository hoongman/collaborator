Given(/^a user exists with the following username and password$/) do |login|
	
	login.hashes.each do |user|
		User.create(username: user['username'], password: user['password'])
	end
end

When(/^I login with my username and password$/) do |login|
	login.hashes.each do |user|
	end
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

Given(/^a user is logged in$/) do
  User.create(username: 'testuser', password: 'testpass')
  visit '/'
  within('#login-form') do
  	fill_in 'username', :with => 'testuser'
  	fill_in 'password', :with => 'testpass'
  	click_button 'Login'
  end
end