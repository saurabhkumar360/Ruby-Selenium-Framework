require 'selenium-webdriver'
require 'test-unit'
require_relative '../Core/helper'
require_relative '../Pages/home_page'
require_relative '../Pages/registration'
require_relative '../Assertion/assertion'

class TC002 < Core

  def test_create_test_script_to_register_account

    registrationPage = REGISTRATION.new(@@driver)
    registrationPage.navigate_to_registration_page

    # Random Email Generated
    emails = SecureRandom.alphanumeric(6)
    emails += "@yopmail.com"

    registrationPage.enter_personnal_details "Saurabh", "Singh", emails,
                                 "+91-9872718876", "987999900"

    registrationPage.enter_address_details "Saksoft", "Sec-62", "Near Metro Station",
                               "Noida", "198811", "India", "Uttar Pradesh"

    registrationPage.enter_password_details "Saurabh@123"

    registrationPage.check_agree_continue
    assert_equal "Your Account Has Been Created!", @@driver.title
  end

end