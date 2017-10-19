Feature: Admin can administer all objects
  As a Admin
  To administer the page
  I would like to be able to create, update and delete on all objects the system

  Background:
    Given The following admins exist
      | email             | password | super_admin |
      | admin@example.com | password | yes         |
    And I go to the dashboard

  Scenario: Logging in Successfully
    When I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "password"
    And I click "Login"
    Then I should see "Signed in successfully."

  Scenario: Attempting to log in with an incorrect email address
    When I fill in "Email" with "not-an-admin@example.com"
    And I fill in "Password" with "not-my-password"
    And I click "Login"
    Then I should see "Login"
    And I should see "Invalid Email or password."

  Scenario: Attempting to log in with an incorrect password
    When I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "not-my-password"
    And I click "Login"
    Then I should see "Login"
    And I should see "Invalid Email or password."