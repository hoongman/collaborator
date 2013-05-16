Given(/^a user is logged in$/) do
    User.create(username: 'testname', password: 'testpassword')
    visit '/'
    within('#login-form') do
    fill_in 'username', :with => 'testname'
    fill_in 'password', :with =>'testpassword'
    click_button 'Login'
  end
end

Then(/^I should see the goodbye page$/) do
  page.should have_content 'Thanks for Watching!'
end

And(/^I cannot access the list of groups$/) do
  visit '/groups'
  page.should_not have_content 'Your groups'
end