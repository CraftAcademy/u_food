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