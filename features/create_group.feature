Feature: Create a group
  In order to have multiple groups
  As Bob
  I need to create a group

  What we know:
  =============
  - A group can be created
  - Groups are visible
  - Needs a title


  Open Questions:
  ===============
  - Do we create one group at a time or multiple?
  

  Scenario: Create a group
    Given the following groups are available:
    | group name |
    | Pandas |
    | April Cohorters |
    When I am on the add a new group page
    And I fill in "add_group" with "The April Group"
    And I press "Add Group"
    When I am on the list of groups page
    Then I will see the following groups:
    | group name |
    | Pandas |
    | April Cohorters |
    | The April Group |
