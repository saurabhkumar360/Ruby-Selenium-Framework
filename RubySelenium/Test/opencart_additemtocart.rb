require "selenium-webdriver"
require_relative '../Templates/add_item_to_cart'
require_relative '../Helper/helper'

#---------------------------------------------------------------------------------------------------------------

chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$driver = Selenium::WebDriver.for :chrome

#-----------------------------------------------------------------------------------------------------------------
page = ADDITEMTOCART.new($driver)

puts('Start Browser')
page.start_browser

puts('Navigate to product Details page')
page.navigate_to_product_details_page

puts('Verify the page title')
page.verify_page_title

puts('Item has been added successfully to the cart')
page.add_item_to_card

puts('Added item is showing in the cart')
page.verify_item_In_cart
