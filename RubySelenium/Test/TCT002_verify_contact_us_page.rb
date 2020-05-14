# frozen_string_literal: true

require 'selenium-webdriver'
require 'test-unit'
require_relative '../Core/helper'
require_relative '../Pages/contactus_page'
require_relative '../Assertion/assertion'

class TC002 < Core
  def test_verify_contactus_page
    puts('Start Browser')
    page = Contactus_Page.new(@@driver)

    puts('Click to Phone icon')
    page.element_click

    puts('Verify the page title')
    validate = Assertion.new
    title = validate.verify_page_title(@@driver, 'Contact Us')
    assert_true(title, '[Error] wrong title')

    puts('Verify contact page')
    page.verify_contact_page('Your Store', '123456789')

    puts('Check validation messages')
    page.validation_check

    puts('fill contact form')
    page.contact_form('user 1', 'dummy@mailinator.com', 'I have an issue with the product delivered.')
  end
end
