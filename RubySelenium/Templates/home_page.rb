require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require 'json'
require_relative "../Helper/helper"
#-------------------------------------------------------------------------------------
class OPENCART

  MY_ACCOUNT          = { css: 'a.dropdown-toggle > span.hidden-xs'}
  HOME_PAGE_LOGO      = { css: 'img.img-responsive:nth-child(2)'}
  SEARCH_BOX          = { css: 'div.input-group > input'  }
  SEARCH_BOX_BUTTON   = {css:'span.input-group-btn > button'}
  TOP_SEARCH_RESULT   = {css:'h4:nth-child(1) > a:nth-child(1)'}
  DesktopTab          = {xpath: "(//a[contains(text(),'Desktops')])[1]"}
  ShowAllComponents   = {xpath: "(//*[@class='see-all'])[1]"}
  SearchedItem        = {css: "div.caption>h4>a"}
  TotalSearchedItems  = {xpath: "//a[contains(text(),'Desktops ')]"}

#-------------------------------Locators for header section------------------------------------------

  DESKTOP             =  { xpath: "//a[text()='Desktops']"}
  LAPTOPS            =  { xpath:"//a[text()='Laptops & Notebooks']"}
  COMPONENTS          =  { xpath:"//a[text()='Components']"}
  TABLETS             =  { xpath:"//a[text()='Tablets']"}
  SOFTWARE            =  { xpath:"//a[text()='Software']"}
  PHONE              =  { xpath:"//a[text()='Phones & PDAs']"}
  CAMERA              =  { xpath:"//a[text()='Cameras']"}
  MP3                 =  { xpath:"//a[text()='MP3 Players']"}

#Desktop hover:
  PC                   =  { xpath:"//a[contains(text(),'PC')]"}
  MAC                  =  { xpath:"//a[contains(text(),'Mac')]"}
  SHOW_ALL_DESKTOPS    =  { xpath:"//a[text()='Show All Desktops']"}

#Laptops & Notebooks hover
  MACS                 =  { xpath:"//a[contains(text(),'Macs')]"}
  WINDOWS              =  { xpath:"//a[contains(text(),'Windows')]"}
  SHOW_ALL_LAPTOPS=  { xpath:"//a[text()='Show All Laptops & Notebooks']"}

#Components hover
  MICE_AND_TRACKBALLS   =  { xpath:"//a[contains(text(),'Mice and Trackballs')]"}
  MONITORS              =  { xpath:"//a[contains(text(),'Monitors')]"}
  PRINTERS              =  { xpath:"//a[contains(text(),'Printers')]"}
  SCANNERS              =  { xpath:"//a[contains(text(),'Scanners')]"}
  WEB_CAMERAS           =  { xpath: "//a[contains(text(),'Web Cameras')]"}
  SHOW_ALL_COMPONENTS   =  { xpath:"//a[text()='Show All Components']"}

#Mp3 Players hover
  TEST11                =  { xpath: "//a[contains(text(),'test 11')]"}
  TEST12                =  { xpath: "//a[contains(text(),'test 12')]"}
  TEST15                =  { xpath: "//a[contains(text(),'test 15')]"}
  TEST16                =  { xpath: "//a[contains(text(),'test 16')]"}
  TEST17                =  { xpath: "//a[contains(text(),'test 17')]"}
  TEST18                =  { xpath: "//a[contains(text(),'test 18')]"}
  TEST19                =  { xpath: "//a[contains(text(),'test 19')]"}
  TEST20                =  { xpath: "//a[contains(text(),'test 20')]"}
  TEST21                =  { xpath: "//a[contains(text(),'test 21')]"}
  TEST22                =  { xpath: "//a[contains(text(),'test 22')]"}
  TEST23                =  { xpath: "//a[contains(text(),'test 23')]"}
  TEST24                =  { xpath: "//a[contains(text(),'test 24')]"}
  TEST4                 =  { xpath: "//a[contains(text(),'test 4')]"}
  TEST5                 =  { xpath: "//a[contains(text(),'test 5')]"}
  TEST6                 =  { xpath: "//a[contains(text(),'test 6')]"}
  TEST7                 =  { xpath: "//a[contains(text(),'test 7')]"}
  TEST8                 =  { xpath: "//a[contains(text(),'test 8')]"}
  TEST9                 =  { xpath: "//a[contains(text(),'test 9')]"}
  SHOW_ALL_MP3PLAYERS   =  { xpath: "//a[text()='Show All MP3 Players']"}

#========================METHODS=====================================================================================
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

def start_browser
  $helperpage = HELPER.new(@driver);
  $helperpage.maximize_window
  @file = File.read('../Data/data.json')
  @data_hash = JSON.parse(@file)
  home_page = @data_hash['url_homepage']
  driver.get(home_page)
end

  def search_for(search_term)
    driver.find_element(SEARCH_BOX).clear
    driver.find_element(SEARCH_BOX).send_keys search_term
    driver.find_element(SEARCH_BOX_BUTTON).click
  end

  def search_result_present?(search_result)
    wait_for { displayed?(TOP_SEARCH_RESULT) }
    driver.find_element(TOP_SEARCH_RESULT).text.include? search_result
  end


  #def verify_page
  #  driver.title.include?('').should == true
  #end

  def wait_for(seconds = 10)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def displayed?(locator)
    driver.find_element(locator).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def header_section_elements()
    matchText(driver.find_element(DESKTOP),"Desktops")
    matchText(driver.find_element(LAPTOPS),"Laptops & Notebooks")
    matchText(driver.find_element(COMPONENTS),"Components")
    matchText(driver.find_element(TABLETS),"Tablets")
    matchText(driver.find_element(SOFTWARE),"Software")
    matchText(driver.find_element(PHONE),"Phones and PDAs")
    matchText(driver.find_element(CAMERA),"Cameras")
    matchText(driver.find_element(MP3),"MP3 Players")
  end

  def submenu_for_desktops()
    driver.find_element(DESKTOP).click
    matchText(driver.find_element(PC),"PC (0)")
    matchText(driver.find_element(MAC),"Mac (1)")
    matchText(driver.find_element(SHOW_ALL_DESKTOPS),"Show All Desktops")
  end

  def submenu_for_laptops_and_notebooks()
    driver.find_element(LAPTOPS).click
    matchText(driver.find_element(MACS),"Macs (0)")
    matchText(driver.find_element(WINDOWS),"Windows (0)")
    matchText(driver.find_element(SHOW_ALL_LAPTOPS),"Show All Laptops & Notebooks")

  end

  def submenu_for_components()
    driver.find_element(COMPONENTS).click
    matchText(driver.find_element(MICE_AND_TRACKBALLS),"Mice and Trackballs (0)")
    matchText(driver.find_element(PRINTERS),"Printers (0)")
    matchText(driver.find_element(SCANNERS),"Scanners (0)")
    matchText(driver.find_element(MONITORS),"Monitors (2)")
    matchText(driver.find_element(WEB_CAMERAS),"Web Cameras (0)")
    matchText(driver.find_element(SHOW_ALL_COMPONENTS),"Show All Components")
  end

  def submenu_for_mp3player
    driver.find_element(MP3).click
    matchText(driver.find_element(TEST4),"test 4 (0)")
    matchText(driver.find_element(TEST5),"test 5 (0)")
    matchText(driver.find_element(TEST6),"test 6 (0)")
    matchText(driver.find_element(TEST7),"test 7 (0)")
    matchText(driver.find_element(TEST8),"test 8 (0)")
    matchText(driver.find_element(TEST9),"test 9 (0)")
    matchText(driver.find_element(TEST11),"test 11 (0)")
    matchText(driver.find_element(TEST12),"test 12 (0)")
    matchText(driver.find_element(TEST15),"test 15 (0)")
    matchText(driver.find_element(TEST16),"test 16 (0)")
    matchText(driver.find_element(TEST17),"test 17 (0)")
    matchText(driver.find_element(TEST18),"test 18 (0)")
    matchText(driver.find_element(TEST19),"test 19 (0)")
    matchText(driver.find_element(TEST20),"test 20 (0)")
    matchText(driver.find_element(TEST21),"test 21 (0)")
    matchText(driver.find_element(TEST22),"test 22 (0)")
    matchText(driver.find_element(TEST23),"test 23 (0)")
    matchText(driver.find_element(TEST24),"test 24 (0)")
matchText(driver.find_element(SHOW_ALL_MP3PLAYERS),"Show All MP3 Players")

  end
  def matchText(element,value)
    if element.text==value
      ;
         else
      puts(" Header Elements with text mismatch for #{element.text}");
    end
  end
  
  def hoverOnDesktopBtnandClick
    $helperpage.hoverOnElement($helperpage.findElement(DesktopTab))
    $helperpage.time_out
    driver.find_element(ShowAllComponents).click
  end

  def getTotalNumOfItems
    $totalcount = $helperpage.getTotalCount(SearchedItem)
     puts ("Total number of Items is ..#{$totalcount}")
  end

  def verifySearchItems
   puts count = $helperpage.getTextFromElement(TotalSearchedItems)
   puts $totalcount = $totalcount+1
   itemcount = $totalcount.to_s
   puts m = count.index("(")
   puts n = count.index(")")
   puts str = count.byteslice(m,n)

   if str.include?(itemcount)
     print "Total Count is Matched\n"
   else
     print "Total Count is not Matched\n"
   end
  end

  def getTextForALLElement()
        allItems =  $helperpage.findElements(SearchedItem)
        allItems.each do |ele|
          puts ele.text
        end
  end
end