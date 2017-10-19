Feature: user can can add dish to order
  As a user
  In order to get food
  I would like to able to add dish to order

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

    Then I navigate to the index page
    And I see the navbar
    And I click "Yappi"

  Scenario: User can add dish to order
    Given I click "Main"
    Then I should see the text "Sushi rolls"
    And I fill in field "amount" and id "Sushi rolls" with "1"
    And I click "Add to cart" within id "Sushi rolls"
    Then I should see the text "Sushi rolls added to cart: 1"
    And My order should contain "1" item
    And I click "1"
    Then I should see the text "1"
    And I should see the text "Sushi rolls"
    And I should see the text "Total items: 1"
    And I should see the text "Total cost: 10.00 $"

  Scenario: User adds multiple items to cart
    Given I click "Main"
    Then I should see the text "Dumplings"
    And I fill in field "amount" and id "Dumplings" with "2"
    And I click "Add to cart" within id "Dumplings"
    Then I should see the text "Dumplings added to cart: 2"
    And My order should contain "2" item
    And I click "2"
    Then I should see the text "2"
    And I should see the text "Dumplings"
    And I should see the text "Total items: 2"
    And I should see the text "Total cost: 30.00 $"

  Scenario: User should not be able to add to order if not signed in
    Given the user is signed out
    Then I click "Main"
    And I should see the text "Dumplings"
    And I should not see link "Add Dumplings to cart"
