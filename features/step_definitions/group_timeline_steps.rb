Given(/^the following posts exist:$/) do |post_content|
  post_content.hashes.each do |post|
    Post.create(content: post['post content'])
  end
end

Then(/^I should see the following posts:$/) do |post_content|
  within('ul') do
    post_content.hashes.each do |post|
      page.should have_content(post['post content'])
    end
  end
end
