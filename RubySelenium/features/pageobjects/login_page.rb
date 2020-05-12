
class LoginPage

  #===============================================================================
  EMAIL = {name: 'email'}
  PASSWORD = {name: 'password'}
  LOGIN_BUTTON = {xpath: '//input[@value="Login"]'}
  #===============================================================================

  def initialize(driver)
    @driver = driver
  end

  def verify_login_title
    puts "Verified login page" if "Account Login".eql? @driver.title
  end

  def fillLoginPage (email, password)
    @driver.find_element(EMAIL).send_keys email
    puts "Filled username field"
    @driver.find_element(PASSWORD).send_keys password
    puts "Filled password field"
    @driver.find_element(LOGIN_BUTTON).click
    puts "Clicked on Login button"
  end

end