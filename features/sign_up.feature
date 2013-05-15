Feature: Allow Bob to sign up to collaborator
	In order to sign up
	As Bob
	I want to create a UN and PW
	Then be able to access the site using these details

What we know:
	to sign up a person needs a username and password
	these should be stored in a database
	these are used to login

Open questions:
	prohibit sign up for existing users?

Scenario: Sign up
	Given I am on the home page
	When I fill in "username" with "Matt" within "#sign-in-form"
	And I fill in "password" with "Elephant" within "#sign-in-form"
	And I press "Sign up"
	And show me the page
	Then I should see the list of groups