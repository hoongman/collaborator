Feature: Delete a post
	In order to remove a group
	As Fred
	I want to delete a group from the list of posts

	What we know:
	- each group has a list of groups
	- users can only delete their own groups
	
	Open questions:
	- why is the sky blue?

	Scenario:
		Given a user is logged in
		Given the following groups exist:
	    | groups |
      | group1 |
    When I am on the groups page
		And I press "Delete"
		Then I should not see "group1"
