Feature: user can can add dish to order
  As a user
  In order to get food
  I would like to able to add dish to order

  Background:
    Given the following category exists
      | name | description |
      | Thai | Thai food   |
    Given the following restaurants exist
      | name    | address   | restaurant_category |
      | My Thai | Stockholm | Thai                |
    And the following dishes exists
      | name        | description         | price | pic_url               | restaurant | category |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Ai         | Main     |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Ai         | Main     |
    And I navigate to the index page
    And I click "My Thai"

  Scenario: User can add dish to order
    Then I should see the text "Sushi rolls"
    And I click "Add Sushi rolls to cart"
    Then I should see the text "Sushi rolls added to cart"
    And I should see the text "Cart: 1"
    Then I should see the text "Dumplings"
    And I click "Add Dumplings to cart"
    Then I should see the text "Dumplings added to cart"
    And I should see the text "Cart: 2"
    And show me the page
    And I click "Show cart"
    Then I should be on cart page
    And I should see the text "Sushi rolls"
    And I should see the text "Dumplings"
    And I should see the text "Total items: 2"
    And I should see the text "Total cost: 25.00 $"
