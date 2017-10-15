Feature:
  As a user
  In order to show as many restaurants as possible,
  I would like it to be able to show several restaurants with the same Geo-location on the map

  @javascript
  Scenario: Restaurants can show up on map
    Given the following restaurants with associations exist
      | name  | address                       | description         | res_category_name | menu_name |
      | Yappi | Hamngatan 37 111 53 Stockholm | Some hip thai place | Japanese          | Lunch     |
    When I navigate to the index page
    And the map has been loaded
    Then I should see "2" pins on the map