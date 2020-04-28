require "selenium-webdriver"
require_relative '../Templates/registration'
require_relative '../Helper/helper'

#---------------------------------------------------------------------------------------------------------------

chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$driver = Selenium::WebDriver.for :chrome


#$driver = Selenium::WebDriver.for :chrome
#-----------------------------------------------------------------------------------------------------------------
page = REGISTRATION.new($driver)
puts('Start Browser')
page.start_browser

puts('Navigate to registration page')
page.navigate_to_registration

puts('Verify the page title')
page.verify_page_title