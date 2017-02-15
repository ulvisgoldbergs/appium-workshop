Feature: 1. Filter feature
  @land
  Scenario: Landline positive filter
    Given I have opened create filter screen
    And I create correct landline filter
    Then I validate created filter

    @transport_correct
  Scenario: Transport positive filter
    Given I have opened create filter screen
    And I create correct transport filter
    Then I validate created filter

    @transport_incorrect
  Scenario: Transport negative filter
    Given I have opened create filter screen
    And I create incorrect transport filter
    Then I check if I am on filter parameter screen

    @vacancy_correct
  Scenario: Vacancy positive filter
    Given I have opened create filter screen
    And I create correct vacancy filter
    Then I validate created filter

    @vacancy_incorrect
  Scenario: Vacancy positive filter
    Given I have opened create filter screen
    And I create incorrect vacancy filter
    Then I check if I am on filter parameter screen
