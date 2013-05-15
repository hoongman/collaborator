Given(/^the following posts exist in the "(.*?)":$/) do |group_name, post_content|
	group = Group.find_or_create_by(group_name: group_name)

	post_content.hashes.each do |post|
    	group.posts.create(content: post['post content'])
  	end
end

Then(/^I should see the following posts:$/) do |post_content|
    post_content.hashes.each do |post|
      page.should have_content(post['post content'])
    end
end

Given(/^the following posts created at the following times exist in the "(.*?)":$/) do |group_name, post_content|
  group = Group.find_or_create_by(group_name: group_name)

  post_content.hashes.each do |post|
      group.posts.create(content: post['post content'], created_at: post['created_at'])
    end
end

Then(/^"(.*?)" should be the first post in the list$/) do |post_content|
  find(:xpath, '//ul/li[1]/h4').text.should eq post_content
end


Then(/^I should see 'Hey Collaborators!'$/) do
  pending # express the regexp above with the code you wish you had
end