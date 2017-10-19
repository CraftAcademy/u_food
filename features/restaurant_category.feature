@javascript
Feature: User can view restaurants with chosen category
  As a User
  In order to pick a restaurant
  I should be able to see a list of available restaurants with my chosen category

  Background:
    Given the following restaurant category exists
      | name | description        |
      | Thai | Sample description |

    And the following restaurants with associations exist
      | name  | address                       | description         | res_category_name | menu_name |
      | Yappi | Hamngatan 37 111 53 Stockholm | Some hip thai place | Thai              | Lunch     |

  Scenario: User can view categories on index page
    Given I navigate to the index page
    Then I should see "Thai"
