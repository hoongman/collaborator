Feature: Find a particular username and password combination
	In order to login
	As Bob
	I want to enter my UN and PW
	Then the DB will take look for my UN
	And will take the PW and combine with a salt
	And compare to a SHA256 hash

	What we know:
	- A person has a username and password
	- Those are stored in the database as a username, but also an encripted password and a key
	- The hashed password is compared to the original + key at login

	Open Questions
	- signup option for new users?
	- 

	Scenario: Login
		Given a user exists with the following username and password
		|username|password|
		|Fred    |secret  |
		When I am on the home page
		And I fill in "username" with "Fred"
		And I fill in "password" with "secret"
		And I press "Login"
		Then I should see the list of groups


	Scenario: Failed Login
		Given a user exists with the following username and password
		|username|password|
		|Fred    |s3cr3t  |
		When I am on the home page
		And I fill in "username" with "Fred"
		And I fill in "password" with "mepassword"
		And I press "Login"
		Then I should see "Please Login"

