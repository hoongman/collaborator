When(/^I add a new message with "(.*?)"$/) do |message|
  fill_in 'message', :with => message
end

When(/^I fill in add group with "(.*?)"$/) do |add_group|
	fill_in 'add group', :with => add_group
end



Given(/^the following groups are available:$/) do |group_names|
  group_names.hashes.each do |group| 
  	Group.create(name: group['group name'])
	end
end

Then(/^I will see the following groups:$/) do |group_names|
  group_names.hashes.each do |group| 
  	page.should have_content(group['group name'])
	end
end

