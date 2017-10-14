Feature: Admin can administer restaurants
  As admin
  I order to add maintain restaurants
  I would like to be able to create, read, update and delete restaurants

  Background:
    Given An admin exists "admin@example.com" "password"
    And I am logged in as admin
    And I go to the dashboard

  Scenario: admin adds new restaurant
    Given I click "Restaurants"
    Then I click "New Restaurant"
    And I fill in "Name" with "New Restaurant"
    And I fill in "Address" with "Street 1"
    And I fill in "Description" with "I really cant come up with some boring description"
    Then I click "Create Restaurant"
    And I should see "Restaurant was successfully created."