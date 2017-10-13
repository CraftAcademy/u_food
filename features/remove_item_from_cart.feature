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
    Given the following user exists
      | email               | encrypted_password |
      | example@example.com | password           |
    And the following user is signed in
      | email               | encrypted_password |
      | example@example.com | password           |
    And the following category exists
      | name | description |
      | Thai | Thai food   |
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
    And I click "Add to cart" within id "Sushi rolls"
    And I fill in field "amount" and id "Dumplings" with "2"
    And I click "Add to cart" within id "Dumplings"

  Scenario: User clicks remove item
    And I click "Remove from cart" within id "Sushi rolls"
    Then I should see "Sushi rolls was removed from your cart"
    And My order should contain "2" item

  Scenario: User removes multiple items
    Given I fill in field "remove_amount" and id "Dumplings" with "2"
    And I click "Remove from cart" within id "Dumplings"
    Then I should see "Dumplings was removed from your cart"
    And My order should contain "1" item

  Scenario: User gives wrong type of input
    Given I fill in field "remove_amount" and id "Dumplings" with "f"
    And I click "Remove from cart" within id "Dumplings"
    Then I should see "Please enter a number"

  Scenario: User clears cart
    Given I click "Show cart"
    And I should see the text "Total items: 3"
    And I click "Clear cart"
    Then My order should contain "0" item
    Then I should be on the restaurant page

  Scenario: User clicks remove item on cart page
    Given I click "Show cart"
    And I click "Remove from cart" within id "Sushi rolls"
    Then I should see "Sushi rolls was removed from your cart"
    And My order should contain "2" item