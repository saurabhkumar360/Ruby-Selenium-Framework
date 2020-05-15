require 'selenium-webdriver'
require 'yaml'
require 'test-unit'

class Library
  @@driver= nil
  def initialize(driver)
    @@driver = driver
  end

def click_on_element(locval)
  @@driver.find_element(locval).click
end

def send_keys(locval, value)
  @@driver.find_element(locval).clear
  @@driver.find_element(locval).send_keys value
end

def get_element_text(locval)
  elementtext = @@driver.find_element(locval).text
  return elementtext
end

end
