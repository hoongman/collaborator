Feature: Post a new message
  In order to comunicate with my mates
  As Fred
  I want to post a message

  What we know:
  =============
  - A person can post a message
  - Message is visible
  - Needs a button and a text field
  - Limit of 300 characters


  Open Questions:
  ===============
  - Spell checker?
  - Does a message need to be part of a group?
  - What about multimedia? (photos, videos, etc)

  Scenario: Posting a new message
    Given I am on the post a new message page
    When I fill in "message" with "Hey Collaborators!"
    And I press "Post"
    Then I should see "Your message: 'Hey Collaborators!' has been posted"

    #get rid of all the mongo logs in cuke
