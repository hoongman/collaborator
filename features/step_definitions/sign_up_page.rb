Then(/^I should see the list of groups$/) do
  page.should have_content 'Your groups'
end
