require 'selenium-webdriver'
require 'yaml'
require 'rspec'

class Project_library

  @driver = nil

  def initialize(driver)
    @driver = driver
  end

  def start_browser
    @@driver.navigate.to('http://opencart.abstracta.us/')
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

  def verify_page_title(title)
    page_title = @@driver.title == title
    puts ("#{page_title}")
  end

end





