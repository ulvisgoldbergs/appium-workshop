Feature: 1. Filter feature

  Scenario: Add filter
    Given I have opened create filter screen
    When I create my first filter
    And I create property filter

  Scenario: Add positive transport filter
    When I create positive transport filter
    And I create property filter

  Scenario: Add negative transport filter
    When I create negative transport filter
    And I create property filter

  Scenario: Add positive vacancy filter
    When I create positive vacancy filter
    And I create property filter

  Scenario: Add negative vacancy filter
    When I create negative vacancy filter
    And I create property filter
