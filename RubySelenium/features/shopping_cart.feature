Feature: Validate the shopping cart
  Scenario: Verify items in shopping cart
    When Go to product details page
    And Add the item to the cart
    And Go to the Shopping cart page
    Then Added item is showing in the Shopping cart