# frozen_string_literal: true

require 'selenium-webdriver'
require_relative '../Templates/contactus_page'
require_relative '../Helper/helper'
#---------------------------------------------------------------------------------------------------------------
chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)), '../drivers', 'chromedriver.exe')
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$driver = Selenium::WebDriver.for :chrome

#-----------------------------------------------------------------------------------------------------------------
page = CONTACT.new($driver)
puts('Start Browser')
page.start_browser

puts 'Click to icon'
page.element_click

puts('Verify the page title')
page.verify_page_title

puts('Maximize window')
page.maximize_window

puts('Verify contact page')
page.verify_contact_page('Your Store','123456789')

puts('fill contact form')
page.contact_form('user 1','dummy@mailinator.com','I have an issue with the product delivered.')
