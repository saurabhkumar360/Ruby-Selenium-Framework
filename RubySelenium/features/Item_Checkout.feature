Feature: To validate, same item will display after add to cart
  Scenario: Add item on cart and item should available for checkout

    Given User should on application home page
    When User should able to see all DeskTop items
    Then User  should able to select particular item
    And After enter all details , User can add item on cart
    Then after add item ,added item should display for checkout

