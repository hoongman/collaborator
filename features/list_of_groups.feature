Feature: List all groups
  In order to see the groups to which i am a member
  As Bob
  I want to see my groups

  What we know:
  =============
  - A person can belong to any number of groups
  - Groups are visible
  - Needs a title


  Open Questions:
  ===============
  - Do we show groups graphically or with text?
  - Do we show any information about the group other than title?
  
  Scenario: Showing all the groups any given user belongs to
    Given the following groups are available:
    | group name |
    | Pandas |
    | April Cohorters |
    When I am on the list of groups page
    Then I will see the following groups:
    | group name |
    | Pandas |
    | April Cohorters |
    