Feature: Show a simple example
  In order to educate the masses
  As a presenter
  I want to show how to test a web page

  Scenario: Wikipedia search
    Given I can access Wikipedia
    When I search for "Capybara"
    Then I find interesting information on this subject
