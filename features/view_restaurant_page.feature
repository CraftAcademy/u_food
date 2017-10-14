Feature: View a restaurant page
  As a User
  In order to see a restaurant page
  I should be able to go to the restaurant page

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
    And I navigate to the index page

  Scenario: User can view a restaurant page
    Given I click "My Thai"
    Then I should see "My Thai"
    And I should see "Stockholm"
    And I should see "Some hip thai place"
    And I should see "Everyday"
