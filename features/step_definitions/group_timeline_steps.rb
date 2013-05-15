Given(/^the following posts exist:$/) do |post_content|
	group = Group.find_or_create_by(group_name: 'master_group', :url => 'master_group')
	
	post_content.hashes.each do |post|
    	group.posts.create(content: post['post content'])
  	end
end

Then(/^I should see the following posts:$/) do |post_content|
  within('ul') do
    post_content.hashes.each do |post|
      page.should have_content(post['post content'])
    end
  end
end


