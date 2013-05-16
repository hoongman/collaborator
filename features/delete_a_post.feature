Feature: Delete a post
	In order to remove a post
	As Fred
	I want to delete my own post from the list of posts

	What we know:
	- each group has a list of posts on the timeline
	- users can only delete their own posts
	
	Open questions:
	- why is the sky blue?

	Scenario:
		Given the following posts created at the following times exist in the "master_group":
      | post content |
      | Hey cohorts  |
    When I am on the master_group timeline page
		And I press "Delete"
		Then I should not see "Hey cohorts"
