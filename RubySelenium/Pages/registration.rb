require 'selenium-webdriver'

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

  def initialize(driver)
    @driver = driver
  end

  # Navigate to Registration page
  def navigate_to_registration_page()
    page = Home_Page.new(@driver)
    page.click_my_account
    page.clik_Register
  end

  # Fill personnal details field
  def enter_personnal_details(firstName, lastName, email, telephone, fax)
    @driver.find_element(name: 'firstname').send_keys firstName
    puts "Entered First Name: #{firstName}"
    @driver.find_element(name: 'lastname').send_keys lastName
    puts "Entered Last Name: #{lastName}"
    @driver.find_element(name: 'email').send_keys email
    puts "Entered Email Id: #{email}"
    @driver.find_element(name: 'telephone').send_keys telephone
    puts "Entered Telephone Number: #{telephone}"
    @driver.find_element(name: 'fax').send_keys fax
    puts "Entered Fax Number: #{fax}"
  end

  # Fill address details field
  def enter_address_details(company, address1, addresss2, city, post, country, state)
    @driver.find_element(name: 'company').send_keys company
    puts "Entered Company Name: #{company}"
    @driver.find_element(name: 'address_1').send_keys address1
    puts "Fill Address Field 1: #{address1}"
    @driver.find_element(name: 'address_2').send_keys addresss2
    puts "Fill Address Field 2: #{addresss2}"
    @driver.find_element(name: 'city').send_keys city
    puts "Fill City Field: #{city}"
    @driver.find_element(name: 'postcode').send_keys post
    puts "Fill Post Code Field: #{post}"
    countrydropdown = @driver.find_element(COUNTRY)
    select_list = Selenium::WebDriver::Support::Select.new(countrydropdown)
    select_list.select_by(:text, country)
    puts "Selected country: #{country}"
    sleep 3
    statedropdown = @driver.find_element(STATE)
    select_list = Selenium::WebDriver::Support::Select.new(statedropdown)
    select_list.select_by(:text, state)
    puts "Selected country: #{state}"
  end

  # Fill Password fields
  def enter_password_details(password)
    @driver.find_element(name: 'password').send_keys password
    @driver.find_element(name: 'confirm').send_keys password
    puts "Fill password & confirm password field"
  end

  # Click agree checkbox & continue button
  def check_agree_continue()
    @driver.find_element(name: 'agree').click
    puts "Check read and agree policy checkbox."
    @driver.find_element(CONTINUE).click
    puts "Check read and agree policy checkbox."
  end

end