require 'selenium-webdriver'
require 'cucumber'
Before do
  chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"/../../drivers","chromedriver.exe")
  Selenium::WebDriver::Chrome.driver_path = chromedriver_path
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-translate')
  $driver = Selenium::WebDriver.for :chrome, options: options
  $driver.get('http://opencart.abstracta.us/')
end

After do
  $driver.quit
end