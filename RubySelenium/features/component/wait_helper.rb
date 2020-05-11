require 'selenium-webdriver'

class WaitHelper

  def self.wait_element_clickable(element)
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until{element.displayed?}
  end

end