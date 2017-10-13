Feature: As a user
  In order to use the application
  I should be able to sign in to my account

  Background:
    Given the following user exists
      | email               | password |
      | example@example.com | password |
    And I navigate to the index page
    And I click "Sign In"

  Scenario: User provides valid credentials
    Given I navigate to the index page
    And I should see link "Sign In"
    And I should not see link "Sign Out"
    And I click "Sign In"
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "password"
    And I click "Sign in"
    And I should see the text "Signed in successfully"
    And I should not see link "Sign In"
    And I click "Sign Out"
    And I should see the text "Signed out successfully"

  Scenario: User fails to provide existing email
    Given I navigate to the index page
    And I click "Sign In"
    And I fill in "Email" with "examp@examle.com"
    And I fill in "Password" with "password"
    And I click "Sign in"
    And I should see the text "Invalid Email or password."