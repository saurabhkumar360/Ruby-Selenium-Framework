require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require 'json'
require_relative "../Helper/helper";
#-------------------------------------------------------------------------------------
class OPENCART

  MY_ACCOUNT          = { css: 'a.dropdown-toggle > span.hidden-xs'}
  HOME_PAGE_LOGO      = { css: 'img.img-responsive:nth-child(2)'}
  SEARCH_BOX          = { css: 'div.input-group > input'  }
  SEARCH_BOX_BUTTON   = {css:'span.input-group-btn > button'}
  TOP_SEARCH_RESULT   = {css:'h4:nth-child(1) > a:nth-child(1)'}

#========================METHODS=====================================================================================
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

def start_browser
  @file = File.read('../Data/data.json')
  @data_hash = JSON.parse(@file)
  home_page = @data_hash['url_homepage']
  driver.get(home_page)
end

  def search_for(search_term)
    driver.find_element(SEARCH_BOX).clear
    driver.find_element(SEARCH_BOX).send_keys search_term
    driver.find_element(SEARCH_BOX_BUTTON).click
  end

  def search_result_present?(search_result)
    wait_for { displayed?(TOP_SEARCH_RESULT) }
    driver.find_element(TOP_SEARCH_RESULT).text.include? search_result
  end


  #def verify_page
  #  driver.title.include?('').should == true
  #end

  def wait_for(seconds = 10)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def displayed?(locator)
    driver.find_element(locator).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

end