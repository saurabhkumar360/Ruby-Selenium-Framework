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
  driver.manage.timeouts.implicit_wait = 30
 end

 end

