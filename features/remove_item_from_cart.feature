Feature: remove item from cart
  As a user
  In order to change my mind
  I would like to remove a dish from cart

  Background:
    Given the following category exists
      | name | description |
      | Thai | Thai food   |
    Given the following restaurants exist
      | name    | address   | restaurant_category |  description          |
      | My Thai | Stockholm | Thai                |  Some hip thai place  |
    And the following dishes exists
      | name        | description         | price | pic_url               |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 |
    And I navigate to the index page
    And I click "My Thai"
    And I click "Add Sushi rolls to cart"

  Scenario: User clicks remove item
    Given I click "Remove Sushi rolls"
    Then I should see "Sushi rolls was removed from your cart"
    And My order should contain "0" item
