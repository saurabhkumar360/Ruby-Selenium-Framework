require 'yaml'

class Login
  #=========================LOCATORS=============================
  LOGIN = { xpath: "//input[@value='Login']" }.freeze

  def id_value(value)
    { id: value }.freeze
  end

  #===========================METHOD==================================
  def loginPage(email,password)
    $driver.find_element(id_value('input-email')).send_keys email
    $driver.find_element(id_value('input-password')).send_keys password
    $driver.find_element(LOGIN).click
  end
end
