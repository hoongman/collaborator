Feature: Have a login page requiring a username and password
  in order to login securely
  As Fred
  I want to enter my username and password

  What we know:
  ============
  - A person has a username and password
  - Those are stored in a database as a key:value pair
  - They are compared against submissions from login page to allow access

  Open questions:
  ==============
  - sign up option for new users


  Scenario: Login
   Given a user exists with the following username and:
    |username|
    |Fred    |
   When I enter the username on the login page:
    |username|
    |Fred    |
   Then I should be sent to the welcome page
   But if I enter unmatched or unknown login details
   Then I should be sent to an unsuccessful login page 
