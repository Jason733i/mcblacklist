Feature: As a registered user, I should be able to create, read, update, delete and show my servers.

  Scenario: Basic login
    Given I start on the home page
    Then I should see "This is the homepage"
    And I follow "Register"
    Then I should see "Sign up"
    And I fill in "Username:" with "Test"
    And I fill in "Email:" with "test@test.com"
    And I fill in "Password:" with "secret"
    And I fill in "Confirm:" with "secret"
    And I follow "Sign up"
    Then I should see "This is the homepage"


