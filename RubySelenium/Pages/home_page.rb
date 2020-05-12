require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require 'rspec'
#-------------------------------------------------------------------------------------
class Home_Page

  #===================================================================================
  MY_ACCOUNT  =  {css: 'a.dropdown-toggle > span.hidden-xs'}
  LOGIN       =  {xpath: '//a[text()="Login"]'}
  REGISTER    =  {xpath: '//a[text()="Register"]'}
  #===================================================================================
  @driver= nil

  def initialize(driver)
    @driver = driver
  end

  def click_my_account()
    @driver.find_element(MY_ACCOUNT).click
    puts "Clicked on My Account"
  end

  def clik_login()
    @driver.find_element(LOGIN).click
    puts "Clicked on Login link"
  end

  def clik_Register()
    @driver.find_element(REGISTER).click
    puts "Clicked on Register link"
  end
end