
class HomePage
  #=================================================================================
  TOPNAV = {css: 'nav#top'}
  LEFT_TOP_NAV = {css: 'nav#top div.pull-left'}
  RIGHT_TOP_NAV = {css: 'nav#top div.pull-left'}
  CURRENCY_DROPDOWN = {css: 'nav#top div.pull-left button.dropdown-toggle'}
  SEARCH_INPUT = {css: 'div.input-group > input'}
  SEARCH_ICON = {css:'span.input-group-btn > button'}

  MY_ACCOUNT  =  {css: 'a.dropdown-toggle > span.hidden-xs'}
  LOGIN       =  {xpath: '//a[text()="Login"]'}
  REGISTER    =  {xpath: '//a[text()="Register"]'}
  ADD_TO_WISHLIST = {css: 'button > i.fa-heart'}
  SUCCESS_WISHLIST_MSG = {css: 'div.alert-success'}
  #=================================================================================

  @driver = nil

  def initialize(driver)
    @driver = driver
  end

  def navigate_opencart_homepage()
    @driver.navigate.to ConfigFileReader.get_url
    puts "Navigated to url: #{ConfigFileReader.get_url}"
  end

  def get_title()
    title = @driver.title
    return title;
  end

  def get_url_page()
    url = @driver.current_url
    return url;
  end

  def enter_search_value(item)
    @driver.find_element(SEARCH_INPUT).send_keys item
    puts "Entered value: #{item}"
  end

  def click_search_icon()
    @driver.find_element(SEARCH_ICON).click
    puts "Clicked on search icon."
  end

  def click_my_account()
    @driver.find_element(MY_ACCOUNT).click
    puts "Clicked on My Account"
  end

  def click_login()
    @driver.find_element(LOGIN).click
    puts "Clicked on Login link"
  end

  def clik_Register()
    @driver.find_element(REGISTER).click
    puts "Clicked on Register link"
  end

  def click_by_text(value)
    element = @driver.find_element(xpath: "//a[contains(text(),'#{value}')]")
    WaitHelper.wait_element_clickable(element)
    element.click
    puts "Clicked on #{value} link."
  end

  def click_button(value)
    element = @driver.find_element(xpath: "//button[contains(text(),'#{value}')]")
    WaitHelper.wait_element_clickable(element)
    element.click
    puts "Clicked on #{value} link."
  end

  def click_add_to_wishList()
    @driver.find_element(ADD_TO_WISHLIST).click
    puts "Clicked on ADD TO WISHLIST icon"
  end

  def get_wishlist_added_msg()
    msg = @driver.find_element(SUCCESS_WISHLIST_MSG).text
    return msg;
  end

end