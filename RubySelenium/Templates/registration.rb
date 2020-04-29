require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require_relative "../Helper/helper";

class REGISTRATION

  MY_ACCOUNT          = { css: 'a.dropdown-toggle > span.hidden-xs'}
  REGISTER            = { css: '.dropdown-menu-right li:nth-child(1) > a'}
  PAGE_TITLE          = { xpath: "//h1[contains(text(),'Register Account')]"}
#------Your Personal Details----------
  FIRST_NAME          = { xpath: "//input[@id='input-firstname']"}
  LAST_NAME           = { xpath: "//input[@id='input-lastname']"}
  EMAIL               = { xpath: "//input[@id='input-email']"}
  TELEPHONE           = { xpath: "//input[@id='input-telephone']"}
#------Your Address-----------------------------------------------------

  ADDRESS_1           = { css:'#input-address-1'}
  CITY                = { css:'#input-city'}
  POSTAL_CODE         = { css:'#input-postcode'}
  COUNTRY             = { css:'#input-country'}
  STATE               = { css:'#input-zone'}
#------Your Password-----------------------------------------------------
  PASSWORD             = { css:'#input-password'}
  CONFIRM_PASSWORD     = { css:'#input-confirm'}
  CONTINUE             = { xpath:"//input[@class='btn btn-primary']" }
#========================METHODS=====================================================================================
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def start_browser
    @file = File.read('../Data/data.json')
    @data_hash = JSON.parse(@file)
    home_page = @data_hash['url_registration_page']
    driver.get(home_page)
  end

  def verify_page_title
   puts("The page title is #{driver.title}")
   if driver.title == 'Register Account'
     print 'Correct Title'
   else
     print 'Wrong page title'
   end
 end
end