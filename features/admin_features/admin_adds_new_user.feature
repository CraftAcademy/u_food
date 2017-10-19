Feature: Admin can administer users
  As admin
  I order to maintain users
  I would like to be able to create, read, update and delete users

  Background:
    Given The following admins exist
      | email                        | password | super_admin |
      | admin@example.com            | password | yes         |
      | restaurant_owner@example.com | password | no          |

    And I am logged in to AA as "admin@example.com"
    And I go to the dashboard

  Scenario: Add new super admin
    Given I click "Admin Users"
    Then I click "New Admin User"
    And I fill in "Email" with "admin2@example.com"
    And I fill in "Password*" with "password"
    And I fill in "Password confirmation" with "password"
    And I click_on_checkbox "Super admin"
    And I click "Create Admin user"
    Then I should see "Admin user was successfully created."

  Scenario: Admin updates admin user
    Given I click "Admin Users"
    Then I click "Edit" for "restaurant_owner@example.com" admin user
    And I fill in "Email" with "owner@example.com"
    And I fill in "Password*" with "password2"
    And I fill in "Password confirmation" with "password2"
    When I click "Update Admin user"
    Then I should see "Admin user was successfully updated."

  Scenario: Admin deletes admin user
    Given I click "Admin Users"
    Then I click "Delete" for "restaurant_owner@example.com" admin user
    Then I should see "Admin user was successfully destroyed."

  Scenario: Missing info when creating new admin user
    Given I click "Admin Users"
    Then I click "New Admin User"
    And I fill in "Email" with ""
    And I fill in "Password*" with "password"
    And I fill in "Password confirmation" with "password"
    And I click_on_checkbox "Super admin"
    And I click "Create Admin user"
    Then I should see "Email* can't be blank"

  Scenario: Short password when creating new admin user
    Given I click "Admin Users"
    Then I click "New Admin User"
    And I fill in "Email" with "owner@example.com"
    And I fill in "Password*" with "pas"
    And I fill in "Password confirmation" with "password"
    And I click_on_checkbox "Super admin"
    And I click "Create Admin user"
    Then I should see "Password* is too short"

  Scenario: Short password when creating new admin user
    Given I click "Admin Users"
    Then I click "New Admin User"
    And I fill in "Email" with "owner@example.com"
    And I fill in "Password*" with "password"
    And I fill in "Password confirmation" with "Password"
    And I click_on_checkbox "Super admin"
    And I click "Create Admin user"
    Then I should see "Password confirmation doesn't match"