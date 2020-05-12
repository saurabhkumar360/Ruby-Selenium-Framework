require 'selenium-webdriver'
require 'yaml'
require 'test-unit'

class Core < Test::Unit::TestCase
  def setup
    chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
    @@driver = Selenium::WebDriver.for :chrome
    config = YAML.load_file '../Configuration/config.yml'
    puts config[['applicationUrl']]
    @@driver.get(config['applicationUrl'])
  end

  def teardown
    @@driver.quit
  end

  def maximize_window
    @@driver.manage.window.maximize
  end

  def time_out
    @@driver.manage.timeouts.implicit_wait = 30
  end
end