Feature: user can see dishes and their info
  As a user
  In order to get food
  I would like to see a list of dishes and info about them

  Background:
    Given the following category exists
      | name        | description         |
      | Japanese    | Japanese food       |
    And the following dish category exists
      | name        |
      | Main        |
    And the following dishes exists
      | name        | description         | price               | pic_url                      | dish_category |
      | Sushi rolls | Tasty Japanese food | 10                  | https://goo.gl/images/hpTGCV | Main          |
    And the following restaurants exist
      | name        | address             | restaurant_category |
      | Yappi       | Stockholm           | Japanese            |
    Then I navigate to the index page
    And I click "Yappi"

  Scenario: user can view dishes
    Given I click "Main"
    Then I should see the text "Sushi rolls"
    And I should see the text "Tasty Japanese food"
    And I should see the text "10"
    And I should see the picture "https://goo.gl/images/hpTGCV"
