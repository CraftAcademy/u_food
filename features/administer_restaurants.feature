Feature: Admin can administer restaurants
  As admin
  I order to add maintain restaurants
  I would like to be able to create, read, update and delete restaurants

  Background:
    Given the following category exists
      | name        | description |
      | Thai        | Thai food   |

    And the following restaurants exist
      | name        | address             | restaurant_category   |  description          |
      | My Thai     | Stockholm           | Thai                  |  Some hip thai place  |

    And An admin exists "admin@example.com" "password"
    And I am logged in as admin
    And I go to the dashboard

  Scenario: Admin adds new restaurant
    Given I click "Restaurants"
    Then I click "New Restaurant"
    And I fill in "Name" with "The New Thai Restaurant"
    And I fill in "Address" with "Street 1"
    And I fill in "Description" with "I really cant come up with some boring description"
    Then I click "Create Restaurant"
    And I should see "Restaurant was successfully created."

  Scenario: Admin updates restaurant
    Given I click "Restaurants"
    When I click "Edit" for "My Thai"
    And I fill in "Name" with "The Old Thai Restaurant"
    And I fill in "Address" with "Street 78"
    And I fill in "Description" with "To many descriptions to fill out"
    When I click "Update Restaurant"
    Then I should see "Restaurant was successfully updated."

  @javascript
  Scenario: Admin deletes restaurant
    Given I click "Restaurants"
    When I click "Delete" for "My Thai"
#    And I click ok on alert box
    Then I should see "Restaurant was successfully destroyed."