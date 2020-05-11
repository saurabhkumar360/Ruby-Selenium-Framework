require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require 'rspec'
#-------------------------------------------------------------------------------------
class Home_Page
    @driver= nil
  def initialize(driver)
    @driver = driver
  end
end