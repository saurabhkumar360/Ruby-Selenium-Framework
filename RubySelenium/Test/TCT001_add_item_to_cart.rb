require 'selenium-webdriver'
require 'test-unit'
require_relative '../Core/helper'
require_relative '../Pages/add_item_to_cart'
require_relative '../Assertion/assertion'

class TC001 < Core

    def test_add_item_to_cart
    page = Add_Item_To_Cart.new(@@driver)
    validate = Assertion.new
    page.go_to_item_details_page
    title = validate.verify_page_title(@@driver, 'HP LP3065')
    assert_true(title,'[Error] wrong title')
    page.add_item_to_cart
    elemnttext = page.verify_item_added_to_cart('HP LP3065')
    assert_true(elemnttext,'[Error] item is not showing in the shopping cart')
    end
end

