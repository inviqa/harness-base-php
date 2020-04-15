Feature: View the homepage
  In order to access the Magento Store
  As a visitor
  I want to be able to view the homepage

  # Mink will use default_session
  # which is configured to use goutte (see behat.yml)
  Scenario: visitor views the homepage
    When I visit the home page
    Then I should see the home page

  # by adding the javascript tag Mink will use the javascript_sesion
  # which is configured to use chrome (see behat.yml)
  @javascript
  Scenario: visitor views the homepage in chrome
    When I visit the home page
    Then I should see the home page