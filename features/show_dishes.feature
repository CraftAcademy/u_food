Feature: user can see dishes and their info
  As a user
  In order to get food
  I would like to see a list of dishes and info about them

  Background:

    Given the following restaurants with associations exist
      | name    | address    |  description          | res_category_name | menu_name    |
      | Yappi   | Stockholm  |  Some hip thai place  | Japanese          | Lunch        |

    Then I navigate to the index page
    And I click "Yappi"

  Scenario: the restaurant's dish categories are displayed
    Then I should see link "DishCategory"

  Scenario: user can view dishes
    Then I click "DishCategory"
    Then I should see the text "DishName"
    And I should see the text "10"
    And I should see the picture "https://goo.gl/images/hpTGCV"