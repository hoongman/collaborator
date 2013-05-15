Feature: Screen to add and remove users
	In order to manage users
	As an administrator
	I want to enter valid UN and PW
	Then the DB will take these as valid UN and PW key value pairs

	What we know:
	- A person has a username and password
	- Those are stored in the database as a username
	- The password is compared to the original at login

	Open Questions
	- signup option for new users? 

	Scenario: Users
		When I am on the create users page

