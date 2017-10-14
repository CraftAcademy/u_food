Feature: User can select restaurant by category
  As a user
  In order to get choose what to eat
  I would like to see a restaurant by category

  Background:
    Given the following category exists
      | name    | description  |
      | Thai    | Thai food    |
      | Mexican | Mexican food |

    Given the following menu exist
      | name      |
      | Everyday  |
    Given the following restaurants exist
      | name       | address     | restaurant_category |  description              | menu     |
      | My Thai    | Stockholm   | Thai                |  Some hip thai place      | Everyday |
      | My Mexican | Mexico city | Mexican             |  Some nice mexican place  | Everyday |

  Scenario: User can see restaurant by category
    Given I navigate to the index page
    Then I should see "My Thai"
    And I should see "Stockholm"