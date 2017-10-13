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
    And the following category exists
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
    Then I navigate to the index page
    And I click "My Thai"

  Scenario: User can add dish to order
    Given I click "Main"
    Then I should see the text "Sushi rolls"
    And I fill in field "amount" and id "Sushi rolls" with "1"
    And I click "Add to cart" within id "Sushi rolls"
    Then I should see the text "Sushi rolls added to cart: 1"
    And I should see the text "Cart: 1"
    And I click "Show cart"
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
    And I should see the text "Cart: 2"
    And I click "Show cart"
    Then I should see the text "2"
    And I should see the text "Dumplings"
    And I should see the text "Total items: 2"
    And I should see the text "Total cost: 30.00 $"

  Scenario: User should not be able to add to order if not signed in
    Given the user is signed out
    Then I click "Main"
    And I should see the text "Dumplings"
    And I should not see link "Add Dumplings to cart"