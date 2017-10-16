Feature: Admin can administer users
  As admin
  I order to maintain users
  I would like to be able to create, read, update and delete users

  Background:
    Given An admin exists "admin@example.com" "password"
    And I am logged in as admin
    And I go to the dashboard

  Scenario: Add new user
    Given I click "Users"
    Then I click "New User"
    And I fill in "Email" with "user@example.com"

  Scenario: Add new restaurant owner
    Given I click "Admin Users"
    Then I click "New Admin User"
    And I fill in "Email" with "admin2@example.com"
    And I fill in "Password*" with "password"
    And I fill in "Password confirmation" with "password"
    And I fill in "Admin" with "true"
    And I click "Create Admin user"
    Then I should see "Admin user was successfully created."

