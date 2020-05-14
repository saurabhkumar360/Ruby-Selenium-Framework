# frozen_string_literal: true

require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require 'rspec'
require_relative '../Core/helper'

class Contactus_Page
  @driver = nil

  #------------------------------------LOCATORS--------------------------------------------
  SUBMIT = { css: '.buttons>div>input' }.freeze
  def contact_page_panel(index)
    { css: '.col-sm-3:nth-child(' + index + ')>strong' }.freeze
  end

  def contact_page_form_values(value)
    { id: value }.freeze
  end

  def validation_message(value)
    { xpath: "//*[@id='" + value + "']/..//div" }.freeze
  end

  def navigation_top_links(index)
    { css: '.list-inline>li:nth-child('+ index +')>a' }.freeze
  end

  #------------------------------------METHODS--------------------------------------------
  def initialize(driver)
    @driver = driver
  end

  def element_click
    $helperpage = Core.new(@driver)
    $helperpage.maximize_window
    @driver.find_element(navigation_top_links(1.to_s)).click
  end

  def verify_contact_page(address, telephone)
    @driver.find_element(contact_page_panel(1.to_s)).text.include?(address)
    @driver.find_element(contact_page_panel(2.to_s)).text.include?(telephone)
  end

  def contact_form(input_value, email_value, enquiry_value)
    @driver.find_element(contact_page_form_values('input-name')).send_keys input_value
    @driver.find_element(contact_page_form_values('input-email')).send_keys email_value
    @driver.find_element(contact_page_form_values('input-enquiry')).send_keys enquiry_value
    @driver.find_element(SUBMIT).click
  end

  def validation_check
    @driver.find_element(SUBMIT).click
    $helperpage.refresh
    @driver.find_element(validation_message('input-name')).text.include?('Name must be between 3 and 32 characters!')
    @driver.find_element(validation_message('input-email')).text.include?('E-Mail Address does not appear to be valid!')
    @driver.find_element(validation_message('input-enquiry')).text.include?('Enquiry must be between 10 and 3000 characters!')
  end
end
