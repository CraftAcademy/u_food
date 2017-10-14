Feature: User can view restaurants with chosen category
  As a User
  In order to pick a restaurant
  I should be able to see a list of available restaurants with my chosen category

  Background:
    Given the following restaurant category exists
      | name | description        |
      | Thai | Sample description |

  Scenario: User can view categories on index page
    Given I navigate to the index page
    Then I should see "Thai"
    And I should see "Sample description"
