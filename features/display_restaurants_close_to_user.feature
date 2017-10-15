Feature:
  As a user,
  In order to find a restaurant
  I would like to see only restaurants close by (500 meters)

  @javascript
  Scenario: Restaurants only show up when close to the user (500 meter)
    Given the following restaurants with associations exist
      | name  | address                       | description         | res_category_name | menu_name |
      | Yappi | Hamngatan 37 111 53 Stockholm | Some hip thai place | Japanese          | Lunch     |
      | Happi | Hamngatan 27 111 53 Stockholm | Some hip food place | Japanese          | Lunch     |
      | Nappi | Kungsgatan 45 702 24 Orebro   | Some bad food place | Japanese          | Lunch     |
    And I navigate to the index page
    Then I should see the text "Yappi"
    And I should not see the text "Nappi"
    When the map has been loaded
    Then I should see "3" pins on the map