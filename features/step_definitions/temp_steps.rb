When(/^I add a new message with "(.*?)"$/) do |message|
  fill_in 'message', :with => message
end

When(/^I fill in add group with "(.*?)"$/) do |add_group|
	fill_in 'add group', :with => add_group
end

