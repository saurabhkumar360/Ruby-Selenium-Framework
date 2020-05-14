
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


  CURRENCY            ={xpath: "//strong" }
  CHOOSE_CURRENCY     = { xpath: "//i[@class='fa fa-caret-down']"}                #div.btn-group > span.hidden-xs hidden-sm hidden-md
  EURO                ={xpath: "//button[@name='EUR']"}     #button.currency.feature-select btn btn-link btn-block
  POUND               ={xpath: "//button[@name='GBP']"}
  DOLLAR              ={xpath: "//button[@name='USD']"}

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


  def choose_currency(cur)
    @driver.find_element(CHOOSE_CURRENCY).click
    case cur
    when "EURO"
      @driver.find_element(EURO).click
    when "POUND"
      @driver.find_element(POUND).click
    when "DOLLOR"
      @driver.find_element(DOLLAR).click
    else
      raise "Error: Currency value either not in capital letters or has an invalid value (#{cur})"
    end
    puts cur +" is choosen as currency"
  end


  def check_currency
     @currency= @driver.find_element(CURRENCY).text
      puts "Currency is "+@currency+""

      for element in ["MacBook", "iPhone", "Apple Cinema 30\"","Canon EOS 5D"]
        puts "check currency for #{element}"
        @elementDesc=@driver.find_element(xpath: "(//*[text()='"+element+"']/ancestor::*/following-sibling::p)[1]").text
        @elementPrice=@driver.find_element(xpath: "//*[text()='"+element+"']/ancestor::*/following-sibling::p[@class='price']").text
        if @elementPrice.include?(@currency)
          puts element
          puts @elementDesc
          puts @elementPrice
        else
          raise "[Error]"+ element + "  currency doesn't match"
        end
      end
  end


end