Feature: As a user
  In order to use the application
  I should be able to sign up for account

  Scenario: User provides valid credentials
    Given I navigate to the index page
    And I should see link "Sign Up"
    And I should not see link "Sign Out"
    And I click "Sign Up"
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click "Sign up"
    And I should see the text "Welcome! You have signed up successfully."
    And I should not see link "Sign Up"

  Scenario: User fails to provide email
    Given I navigate to the index page
    And I click "Sign Up"
    And I fill in "Email" with ""
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click "Sign up"
    And I should see the text "Email can't be blank"

  Scenario: User fails to confirm password
    Given I navigate to the index page
    And I click "Sign Up"
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "wrong pass"
    And I click "Sign up"
    And I should see the text "Password confirmation doesn't match"

  Scenario: User fails to provide password
    Given I navigate to the index page
    And I click "Sign Up"
    And I fill in "Email" with "example@examlpe.com"
    And I fill in "Password" with ""
    And I fill in "Password confirmation" with ""
    And I click "Sign up"
    And I should see the text "Password can't be blank"

  Scenario: User fails to provide valid email
    Given I navigate to the index page
    And I click "Sign Up"
    And I fill in "Email" with "example"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click "Sign up"
    And I should see the text "Email is invalid"