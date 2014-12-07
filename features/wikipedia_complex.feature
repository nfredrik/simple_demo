Feature: Show a somewhat more complex example
  In order to educate the masses
  As a presenter
  I want to show testing with page objects

  Scenario Outline: Wikipedia search
    Given I can access Wikipedia (2)
    When I search for <subject>
    Then I get a result for <subject>
    And I find interesting information about it
  Examples:
    | subject   |
    | Capybara  |
    | Selenium  |