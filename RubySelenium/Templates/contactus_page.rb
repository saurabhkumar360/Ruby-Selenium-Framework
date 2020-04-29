# frozen_string_literal: true

require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require 'json'
require_relative '../Helper/helper'
require 'test/unit'
#-------------------------------------------------------------------------------------
class CONTACT
  PHONE_ICON = { css: '.list-inline>li>a' }.freeze
  ADDRESS = { css: '.col-sm-3:nth-child(1)>strong' }.freeze
  TELEPHONE = { css: '.col-sm-3:nth-child(2)>strong' }.freeze
  NAME = { id: 'input-name' }.freeze
  EMAIL = { id: 'input-email' }.freeze
  ENQUIRY = { id: 'input-enquiry' }.freeze
  SUBMIT = { css: '.buttons>div>input' }.freeze


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

  def element_click
    driver.find_element(PHONE_ICON).click
  end

  def verify_page_title
    puts("The page title is #{driver.title}")
    if driver.title == 'Contact Us'
      print 'Correct Title'
    else
      print 'Wrong page title'
    end
  end

  def verify_contact_page(address,telephone)
    driver.find_element(ADDRESS).text.include?(address)
    driver.find_element(TELEPHONE).text.include?(telephone)
  end

  def maximize_window
    driver.manage.window.maximize
  end

  def contact_form(input_value, email_value, enquiry_value)
    driver.find_element(NAME).send_keys input_value
    driver.find_element(EMAIL).send_keys email_value
    driver.find_element(ENQUIRY).send_keys enquiry_value
    driver.find_element(SUBMIT).click
  end

  end
