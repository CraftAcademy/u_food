Feature: Admin can administer restaurants
  As admin
  I order to maintain restaurants
  I would like to be able to create, read, update and delete restaurants

  Background:
    Given the following restaurant category exists
      | name    | description  |
      | Thai    | Thai food    |
      | Mexican | Mexican food |

    And the following restaurants exist
      | name    | address   | restaurant_category | description         |
      | My Thai | Stockholm | Thai                | Some hip thai place |

    And An admin exists "admin@example.com" "password"
    And I am logged in as admin
    And I go to the dashboard

  Scenario: Admin adds new restaurant
    Given I click "Restaurants"
    Then I click "New Restaurant"
    And I fill in "Name" with "The New Thai Restaurant"
    And I fill in "Address" with "Street 1"
    And I fill in "Description" with "I really cant come up with some boring description"
    And I select "Thai" from restaurant category dropdown
    Then I click "Create Restaurant"
    And I should see "Restaurant was successfully created."

  Scenario: Admin updates restaurant
    Given I click "Restaurants"
    Then I click "Edit" for "My Thai"
    And I fill in "Name" with "The Old Thai Restaurant"
    And I fill in "Address" with "Street 78"
    And I fill in "Description" with "To many descriptions to fill out"
    And I select "Mexican" from restaurant category dropdown
    When I click "Update Restaurant"
    Then I should see "Restaurant was successfully updated."

  @javascript
  Scenario: Admin deletes restaurant
    Given I click "Restaurants"
    When I click "Delete" for "My Thai"
#    And I click ok on alert box
    Then I should see "Restaurant was successfully destroyed."

  Scenario: Admin adds new restaurant category
    Given I click "Restaurant Category"
    Then I click "New Restaurant Category"
    And I fill in "Swedish" with "Swedish delicatesse"
    Then I click "Create Restaurant Category"
    And I should see "Restaurant Category was successfully created."

  Scenario: Admin adds new restaurant category
    Given I click "Restaurant Category"
    Then I click "Edit" for "Thai"
    And I fill in "Name" with "Chinese"
    And I fill in "Description" with "Chinese food"
    When I click "Update Restaurant Category"
    Then I should see "Restaurant Category was successfully updated."

  @javascript
  Scenario: Admin deletes restaurant category
    Given I click "Restaurants Category"
    When I click "Delete" for "Thai"
#    And I click ok on alert box
    Then I should see "Restaurant Category was successfully destroyed."