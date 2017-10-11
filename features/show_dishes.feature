Feature: user can see dishes and their info
  As a user
  In order to get food
  I would like to see a list of dishes and info about them

  Background:
    Given the following category exists
      | name | description |
      | Thai | Thai food   |
    Given the following menu exist
      | name      |
      | Everyday  |
    Given the following restaurants exist
      | name    | address   | restaurant_category |  description          | menu     |
      | My Thai | Stockholm | Thai                |  Some hip thai place  | Everyday |
    Given the following dishes exists
      | name        | description         | price | pic_url               | restaurant | category |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Ai         | Main     |

    And I navigate to the index page
    And I click "My Thai"

  Scenario: user can view dish names
    Then I should see the text "Sushi rolls"
    And I should see the text "Tasty Japanese food"
    And I should see the text "10"
    And I should see the picture "https://goo.gl/fH7P5F"
    And I should see the text "Ai"
    And I should see the text "Main"
