require 'selenium-webdriver'
require 'cucumber'
Before do
  chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
  Selenium::WebDriver::Chrome.driver_path = chromedriver_path
  $driver = Selenium::WebDriver.for :chrome
  $driver.get('http://opencart.abstracta.us/')
end

After do
  $driver.quit
end