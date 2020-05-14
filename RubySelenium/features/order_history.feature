Feature: Validate the order history page
  Scenario: verify the items which are added to cart and checked out are displayed on order history page
    Given User login to the application
    When User add items to the cart
    And User checkout the items added in the cart
    Then User navigate towards order history page
    And Items should be present on order history page