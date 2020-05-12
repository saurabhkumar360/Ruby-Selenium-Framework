require 'selenium-webdriver'
require 'yaml'
require 'test-unit'

class Core < Test::Unit::TestCase
  def setup
    chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
    @@driver = Selenium::WebDriver.for :chrome
    maximize_window
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
    @@driver.manage.timeouts.implicit_wait = 5
  end

  def hoverOnElement(element)
    @@driver.action.move_to(element).perform
    puts ("hover on Element #{element}" )
  end

  def getTotalCount(element)
    return @@driver.find_elements(element).size

  end

  def getTextFromElement(element)
    return @@driver.find_element(element).text
  end

  def findElement(webElement)
    return @@driver.find_element(webElement)

  end

  def findElements(webElement)
    return @@driver.find_elements(webElement)
  end


  def isElementDisplay(webElement)
    time_out
    result = @@driver.find_elements(webElement).size() > 0
    if result
      result = @@driver.find_element(webElement).displayed?
      puts('Verified Element is Display')
    else
      puts('Verified Element is not Display')
    end

    return result

  end

  def clickUsingJS(webElement)
    @@driver.execute_script("arguments[0].click();", webElement)
  end

end