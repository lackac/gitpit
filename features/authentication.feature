@http://www.pivotaltracker.com/story/show/3676355
Feature: Authentication
  In order to access restricted features of the application
  As a Pivotal Tracker user
  I want to authenticate myself

  Scenario: Log in through a form with a PT account
    Given there is a PT account with username: "veronica", password: "secret"
    When I go to the home page
    And I fill in "Username" with "veronica"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should see a confirmation message
    And I should see "Welcome, veronica"
    But I should not see "Log in"

  Scenario: Failed login
    Given there is no PT account with username: "veronica", password: "bogus"
    When I go to the home page
    And I fill in "Username" with "veronica"
    And I fill in "Password" with "bogus"
    And I press "Login"
    Then I should see an error message
    And I should see "Login"

  Scenario: Logout
    Given I am logged in as "veronica"
    And I follow "Logout"
    Then I should see "Log in"
    And I should see "GitHub + Pivotal Tracker = Pit of Success"

