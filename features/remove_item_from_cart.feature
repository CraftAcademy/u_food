Feature: remove item from cart
  As a user
  In order to change my mind
  I would like to remove a dish from cart

  Background:
    Given the following user exists
      | email               | encrypted_password |
      | example@example.com | password           |

    And the following user is signed in
      | email               | encrypted_password |
      | example@example.com | password           |

    Given the following restaurants with associations exist
      | name    | address    |  description          | res_category_name | menu_name    |
      | Yappi   | Stockholm  |  Some hip thai place  | Japanese          | Lunch        |

    And the following dishes exists
      | name        | description         | price | pic_url               | dish_category |menu_name    |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Main          |Lunch        |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Main          |Lunch        |


    And I navigate to the index page
    And I see the navbar
    And I click "Yappi"
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
    Given I click "3"
    And I should see the text "Total items: 3"
    And I click "Clear cart"
    Then My order should contain "0" item
    Then I should be on the restaurant page

  Scenario: User clicks remove item on cart page
    Given I click "3"
    And I click "Remove from cart" within id "Sushi rolls"
    Then I should see "Sushi rolls was removed from your cart"
    And My order should contain "2" item
