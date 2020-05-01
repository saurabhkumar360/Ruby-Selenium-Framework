require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require_relative "../Helper/helper";

class ADDITEMTOCART

 #------Item Details page-----------------------------------------------------
  RADIO_BUTTON       = {xpath: "//div[@class='radio']/label/input[@value=5]"}
  CHECKBOX_FIELD     = {xpath: "//div[@class='checkbox']/label/input[@value=8]"}
  TEXTBOX_FIELD      = {css: 'input#input-option208'}
  DROPDOWN_FIELD     = {css: 'select#input-option217'}
  TEXTAREA_FIELD     = {css: "textarea#input-option209"}
  UPLOADFILE_BUTTON  = {css: 'button#button-upload222'}
  DATE_PICKER        = {css: 'input#input-option219'}
  TIME_PICKER        = {css: '#input-option221'}
  DATETIME_PICKER    = {css: '#input-option220'}
  ADD_TO_CART_BUTTON = {css: 'button#button-cart'}

#-------------------- Item Cart------------------------
  CART_ITEM_BUTTON  = {css: 'span#cart-total'}
  ITEM_NAME         = {xpath: "//table[@class='table table-striped']/tbody/tr/td[2]/a"}

#========================METHODS=====================================================================================
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def start_browser
    @file = File.read('../Data/data.json')
    @data_hash = JSON.parse(@file)
    home_page = @data_hash['url_homepage']
    driver.manage.window.maximize
    driver.get(home_page)
  end

  def navigate_to_product_details_page
    @file = File.read('../Data/data.json')
    @data_hash = JSON.parse(@file)
    product_details_page = @data_hash['url_product_details_page']
    driver.get(product_details_page)
  end

  def verify_page_title
    puts("The page title is #{driver.title}")
    if driver.title == 'Apple Cinema 30'
      print 'Correct Title'
    else
      print 'Wrong page title'
    end
  end

  def add_item_to_card
    driver.find_element(RADIO_BUTTON).click
    driver.find_element(CHECKBOX_FIELD).click
    driver.find_element(TEXTBOX_FIELD).clear
    driver.find_element(TEXTBOX_FIELD).send_keys "Add Item"
    driver.find_element(DROPDOWN_FIELD).find_element(:css,"option[value='1']").click
    driver.find_element(TEXTAREA_FIELD).send_keys "This is Text Area"
    driver.find_element(UPLOADFILE_BUTTON).send_keys("D:\\RubyLearning\\DocsDocs\\docfile.txt")
    sleep 5
    driver.switch_to.alert.accept
    sleep 5
    driver.find_element(DATE_PICKER).clear
    driver.find_element(DATE_PICKER).send_keys "2020-04-28"
    driver.find_element(TIME_PICKER).clear
    driver.find_element(TIME_PICKER).send_keys "22:10"
    driver.find_element(DATETIME_PICKER).clear
    driver.find_element(DATETIME_PICKER).send_keys "2011-02-20 22:25"
    driver.find_element(ADD_TO_CART_BUTTON).click
    sleep 5
  end


  def verify_item_In_cart
    driver.find_element(CART_ITEM_BUTTON).click
    sleep 5
    item_name = driver.find_element(ITEM_NAME).get_text
    if item_name == 'Apple Cinema 30'
      print 'Collect item is added into the cart'
    else
      print 'Item is not added into the cart'
    end

  end
end