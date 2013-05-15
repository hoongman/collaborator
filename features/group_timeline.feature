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
    
    Given the following posts created at the following times exist in the "master_group":
      | post content |
      | Hey cohorts  |
      | What's up?   |
    When I am on the master_group timeline page
    Then I should see the following posts:
      | post content |
      | Hey cohorts  |
      | What's up?   |

  Scenario: Viewing the timeline in order (latest posts first)
    Given the following posts created at the following times exist in the "master_group":
      | post content | created_at                |
      | Hey cohorts  | 2013-05-14 16:50:21 +0100 |
      | What's up?   | 2013-05-14 15:50:21 +0100 |
      | Last Post    | 2013-05-14 17:50:21 +0100 |
    When I am on the master_group timeline page
    Then "Last Post" should be the first post in the list
      