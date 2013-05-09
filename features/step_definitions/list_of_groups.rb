Given(/^the following groups are available:$/) do  |group_names|

  group_names.hashes.each do |group| 

  	Group.create(name: group['group name'])

	end

end

Then(/^I will see the following groups:$/) do |group_names|
  group_names.hashes.each do |group| 
  	page.should have_content(group['group name'])
	end
end

