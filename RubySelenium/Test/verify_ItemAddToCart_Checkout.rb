require "selenium-webdriver"
require_relative "../Templates/home_page"
require_relative "../Helper/helper"
require_relative "../Templates/Itemdetails_Page"
#---------------------------------------------------------------------------------------------------------------
chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$driver = Selenium::WebDriver.for :chrome
#-----------------------------------------------------------------------------------------------------------------
page = OPENCART.new($driver)
itemDetails = ITEMDETAILS.new($driver)
puts('Start Browser')
page.start_browser


puts ('Hover on Desktop Tab')
page.hoverOnDesktopBtnandClick

puts('Add Item on Cart')
itemDetails.addItemOnCart

puts('Navigate to Shoping Cart')
itemDetails.navigateToShopingCart

puts('Verify Added Item for checkout')
itemDetails.verifyItemDetails



