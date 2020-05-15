require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require 'rspec'
require 'test/unit'
require_relative '../Core/helper'
require_relative '../Core/lib'
require_relative '../Assertion/assertion'

#-------------------------------- Home Page ------------------------------------------
DESKTOP_TAB             = {xpath: "(//a[@class='dropdown-toggle'])[2]"}
SHOW_ALL_DESKTOPS_LINK  = {xpath: "(//a[@class='see-all'])[1]"}
PRODUCT_NAME            = {xpath: "//img[@title='HP LP3065']"}
# ----------------------------Product Details page ------------------------------------
DELIVERY_DATE           = {css: '#input-option225'}
QUANTITY                = {css: '#input-quantity'}
ADD_TO_CART_BUTTON      = {css: 'button#button-cart'}
SUCCESS_ALERT           = {css: 'div.alert-success'}
ITEMS_BUTTON            = {css: 'span#cart-total'}
#------------------------ Item Cart-------------------------------------
ITEM_NAME               = {xpath: "(//a[contains(text(), 'HP LP3065')])[1]"}

class Add_Item_To_Cart
  @@driver= nil
  def initialize(driver)
    @@driver = driver
  end

  def go_to_item_details_page
    $librarypage = Library.new(@@driver)
    $librarypage.click_on_element(DESKTOP_TAB)
    $librarypage.click_on_element(SHOW_ALL_DESKTOPS_LINK)
    $librarypage.click_on_element(PRODUCT_NAME)
  end

  def add_item_to_cart
    $librarypage.send_keys(DELIVERY_DATE, '2011-04-22')
    $librarypage.send_keys(QUANTITY, 2)
    $librarypage.click_on_element(ADD_TO_CART_BUTTON)
  end

  def verify_item_added_to_cart(eletext)
    $librarypage.click_on_element(ITEMS_BUTTON)
    sleep 5
    elementtext = @@driver.find_element(ITEM_NAME).text
    if(elementtext == eletext)
      return true
    else
      return false
    end
  end

end
