require 'selenium-webdriver'
require 'webdrivers'
require 'cucumber'
require 'test/unit/assertions'

Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-translate')
  $driver = Selenium::WebDriver.for :chrome, options: options
  $driver.manage.window.maximize
  $driver.manage.timeouts.page_load = 10
  $driver.manage.timeouts.implicit_wait = 8
  $driver.get('http://opencart.abstracta.us/')
end

After do
  $driver.quit
end