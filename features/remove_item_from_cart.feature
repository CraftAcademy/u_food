Feature: remove item from cart
  As a user
  In order to change my mind
  I would like to remove a dish from cart

  Background:
    Given the following category exists
      | name        | description |
      | Thai        | Thai food   |
    And the following menu exist
      | name      |
      | Everyday  |
    And the following dish category exists
      | name        |
      | Main        |
    And the following restaurants exist
      | name        | address             | restaurant_category   |  description          | menu     |
      | My Thai     | Stockholm           | Thai                  |  Some hip thai place  | Everyday |
    And the following dishes exists
      | name        | description         | price | pic_url               | dish_category |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Main          |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Main          |
    And I navigate to the index page
    And I click "My Thai"
    And I click "Main"
    And I click "Add Sushi rolls to cart"
    And I fill in field "amount" and id "Dumplings" with "2"
    And I click "Add Dumplings to cart"

  Scenario: User clicks remove item
    Given I click "Remove Sushi rolls"
    Then I should see "Sushi rolls was removed from your cart"
    And My order should contain "2" item

  Scenario: User removes multiple items
    Given I fill in field "remove_amount" and id "Dumplings" with "2"
    And I click "Remove Dumplings"
    Then I should see "Dumplings was removed from your cart"
    And My order should contain "1" item

  Scenario: User gives wrong type of input
    Given I fill in field "remove_amount" and id "Dumplings" with "f"
    And I click "Remove Dumplings"
    Then I should see "Please enter a number"