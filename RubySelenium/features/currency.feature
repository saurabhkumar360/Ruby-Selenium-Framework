Feature: verify currency

  Scenario: Verify the changes in currecy value reflect at the displayed items price currency
    Given I am at home page
    When I choose currency
    Then I check price of items displayed are in choosen curency