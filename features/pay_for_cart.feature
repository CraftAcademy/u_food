@javascript
Feature: Restaurant owner can get payment for order
  As a restaurant owner
  in order to get some money
  I need customers to pay on checkout.

  Background:
    Given the following user exists
      | email               | encrypted_password |
      | example@example.com | password           |

    And the following user is signed in
      | email               | encrypted_password |
      | example@example.com | password           |

    Given the following restaurants with associations exist
      | name  | address                       | description         | res_category_name | menu_name |
      | Yappi | Hamngatan 37 111 53 Stockholm | Some hip thai place | Japanese          | Lunch     |

    And the following dishes exists
      | name        | description         | price | pic_url               | dish_category | menu_name |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Main          | Lunch     |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Main          | Lunch     |

    And I navigate to the index page
    And I click "Yappi"
    And I click "Main" category
    Then show me the page
    And I click "Add to cart" within id "Sushi rolls"
    And I fill in field "amount" and id "Dumplings" with "2"
    And I click "Add to cart" within id "Dumplings"
    And I click "Show cart"
    #Then I should be on cart page

  Scenario: I check out and pay with my credit card
    Then show me the page
    Given I click Pay with Card stripe button
    And I fill in my card details
    Then I submit the stripe form