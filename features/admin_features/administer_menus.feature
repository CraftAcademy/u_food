Feature: Admin can administer menus
  As admin
  I order to maintain menus
  I would like to be able to create, read, update and delete menus

  Background:
    Given the following restaurants with associations exist
      | name    | address   | description         | res_category_name | menu_name |
      | My Thai | Stockholm | Some hip thai place | Thai              | Lunch     |
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Breakfast |

    And the following dishes exists
      | name        | description         | price | image    | dish_category | menu_name |
      | Dumplings   | Tasty Japanese food | 15    | kfc.jpeg | Main          | Lunch     |
      | Sushi rolls | Tasty Japanese food | 10    | kfc.jpeg | Main          | Lunch     |

    And The following admins exist
      | email             | password | super_admin |
      | admin@example.com | password | yes         |

    And I am logged in to AA as "admin@example.com"
    And I go to the dashboard

  Scenario: Admin adds new menu
    Given I click "Menus"
    Then I click "New Menu"
    And I fill in "Name" with "Breakfast"
    And I select "My Mex" from menu category dropdown
    Then I click "Create Menu"
    And I should see "Menu was successfully created."

  Scenario: Admin updates menu
    Given I click "Menus"
    Then I click "Edit" for "Lunch" menu
    And I fill in "Name" with "Brunch"
    And I select "My Mex" from menu category dropdown
    When I click "Update Menu"
    Then I should see "Menu was successfully updated."

  @javascript
  Scenario: Admin deletes menu
    Given I click "Menus"
    Then I click "Delete" for "Lunch" menu
#    And I click ok on alert box
    Then I should see "Menu was successfully destroyed."

  Scenario: Admin adds new menu line
    Given I click "Menu Lines"
    Then I click "New Menu Line"
    And I select "Lunch" from menu line dropdown
    And I select "Dumplings" from dish line dropdown
    Then I click "Create Menu line"
    And I should see "Menu line was successfully created."
