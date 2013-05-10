Feature: Have a group timeline
  In order to view group messages
  As Fred
  I want to view a group timeline

  What we know:
  =============
  - A person can see the timline
  - Messages that have been posted are visible

  Open Questions:
  ===============
  - Could have a maximum number of messages
  - Could delete a message from the timeline
  - Could reply to a message

  Scenario: Viewing the timeline
    Given the following posts exist:
      | post content |
      | Hey cohorts  |
      | What's up?   |
    When I am on the master group timeline page
    Then I should see the following posts:
      | post content |
      | Hey cohorts  |
      | What's up?   |
