Feature: Wishlist Items

  Scenario: Verify once you marked the items add to wish list.
  The items will show on wishlist with same details
    Given I am on login page
    And I entered valid credentials
    When I added item to wishlist
    And I clicked on Wishlist link in top nav
    Then I found heading of grid as "My Wish List"
    And I found wishlist grid heading
      | Image        |
      | Product Name |
      | Model        |
      | Stock        |
      | Unit Price   |
      | Action       |
    And I found the item in My Wish List grid