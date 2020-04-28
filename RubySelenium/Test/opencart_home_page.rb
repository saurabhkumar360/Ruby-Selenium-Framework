require "selenium-webdriver"
require_relative "../Templates/home_page"
require_relative "../Helper/helper"
#---------------------------------------------------------------------------------------------------------------
chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$driver = Selenium::WebDriver.for :chrome
#-----------------------------------------------------------------------------------------------------------------
page = OPENCART.new($driver)
puts('Start Browser')
page.start_browser

puts ('Search For iphone')
page.search_for('iphone')

puts ('Verify the result')
page.search_result_present?('iphone')
