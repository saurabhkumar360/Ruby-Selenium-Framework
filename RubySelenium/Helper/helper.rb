require 'selenium-webdriver'
class HELPER

  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  #def start_browser
  #  driver.get("http://opencart.abstracta.us/")
  #end

  def teardown
   driver.quit
 end

  def maximize_window
  driver.manage.window.maximize
 end

  def time_out
  driver.manage.timeouts.implicit_wait = 5
 end
  def hoverOnElement(element)
    driver.action.move_to(element).perform
    puts ("hover on Element #{element}" )
  end

  def getTotalCount(element)
    return driver.find_elements(element).size

  end

  def getTextFromElement(element)
    return driver.find_element(element).text
  end

  def findElement(webElement)
    return driver.find_element(webElement)

  end

  def findElements(webElement)
    return driver.find_elements(webElement)
  end


  def isElementDisplay(webElement)
    #wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    #element = driver.find_element(webElement)
    #wait.until { element.displayed? }
    driver.manage.timeouts.implicit_wait = 5
    result = driver.find_elements(webElement).size() > 0
    if result
      result = driver.find_element(webElement).displayed?
      puts('Verified Element is Display')
  else
      puts('Verified Element is not Display')
    end

    return result

  end

  def clickUsingJS(webElement)
    driver.execute_script("arguments[0].click();", webElement)
  end

 end

