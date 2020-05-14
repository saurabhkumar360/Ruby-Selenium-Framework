require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require 'rspec'
#-------------------------------------------------------------------------------------
class Home_Page

  #===================================================================================
  MY_ACCOUNT  =  {css: 'a.dropdown-toggle > span.hidden-xs'}
  LOGIN       =  {xpath: '//a[text()="Login"]'}
  REGISTER    =  {xpath: '//a[text()="Register"]'}



  DESKTOP             =  { xpath: "//a[text()='Desktops']"}
  LAPTOPS            =  { xpath:"//a[text()='Laptops & Notebooks']"}
  COMPONENTS          =  { xpath:"//a[text()='Components']"}
  TABLETS             =  { xpath:"//a[text()='Tablets']"}
  SOFTWARE            =  { xpath:"//a[text()='Software']"}
  PHONE              =  { xpath:"//a[text()='Phones & PDAs']"}
  CAMERA              =  { xpath:"//a[text()='Cameras']"}
  MP3                 =  { xpath:"//a[text()='MP3 Players']"}

#Desktop
  PC                   =  { xpath:"//a[contains(text(),'PC')]"}
  MAC                  =  { xpath:"//a[contains(text(),'Mac')]"}
  SHOW_ALL_DESKTOPS    =  { xpath:"//a[text()='Show All Desktops']"}

#Laptops & Notebooks
  MACS                 =  { xpath:"//a[contains(text(),'Macs')]"}
  WINDOWS              =  { xpath:"//a[contains(text(),'Windows')]"}
  SHOW_ALL_LAPTOPS=  { xpath:"//a[text()='Show All Laptops & Notebooks']"}

#Components
  MICE_AND_TRACKBALLS   =  { xpath:"//a[contains(text(),'Mice and Trackballs')]"}
  MONITORS              =  { xpath:"//a[contains(text(),'Monitors')]"}
  PRINTERS              =  { xpath:"//a[contains(text(),'Printers')]"}
  SCANNERS              =  { xpath:"//a[contains(text(),'Scanners')]"}
  WEB_CAMERAS           =  { xpath: "//a[contains(text(),'Web Cameras')]"}
  SHOW_ALL_COMPONENTS   =  { xpath:"//a[text()='Show All Components']"}

#Mp3 Players
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
  #===================================================================================
  @driver= nil

  def initialize(driver)
    @driver = driver
  end

  def click_my_account()
    @driver.find_element(MY_ACCOUNT).click
    puts "Clicked on My Account"
  end

  def clik_login()
    @driver.find_element(LOGIN).click
    puts "Clicked on Login link"
  end

  def clik_Register()
    @driver.find_element(REGISTER).click
    puts "Clicked on Register link"
  end

  def matchText(element,value)
    result=false
    if (@driver.find_element(element).text.eql?(value))
      result=true
    else
      return false
      #raise "[Error]"+ @driver.find_element(element).text + "  element value doesn't match"
    end
  end


  def header_section_elements()
    res1=matchText(DESKTOP,"Desktops")
    res2=matchText(LAPTOPS,"Laptops & Notebooks")
    res3=matchText(COMPONENTS,"Components")
    res4=matchText(TABLETS,"Tablets")
    res5=matchText(SOFTWARE,"Software")
    res6=matchText(PHONE,"Phones & PDAs")
    res7=matchText(CAMERA,"Cameras")
    res8=matchText(MP3,"MP3 Players")
    if(!res1 || !res2 || !res3 || !res4 || !res5 || !res6 || !res7 || !res8)
      return false
    end
    puts "Header menu items verified"
    return true
  end

  def submenu_for_desktops()
    @driver.find_element(DESKTOP).click
    res1=matchText(PC,"PC (0)")
    res2=matchText(MAC,"Mac (1)")
    res3=matchText(SHOW_ALL_DESKTOPS,"Show All Desktops")
    if(!res1 || !res2 || !res3)
      return false
    end
    puts "submenu for desktop is verified"
    return true
  end

  def submenu_for_laptops_and_notebooks()
    @driver.find_element(LAPTOPS).click
    res1=matchText(MACS,"Macs (0)")
    res2=matchText(WINDOWS,"Windows (0)")
    res3=matchText(SHOW_ALL_LAPTOPS,"Show All Laptops & Notebooks")
    if(!res1 || !res2 || !res3)
      return false
    end
    puts "submenu for laptops & notebooks verified"
    return true
  end

  def submenu_for_components()
    @driver.find_element(COMPONENTS).click
    res1=matchText(MICE_AND_TRACKBALLS,"Mice and Trackballs (0)")
    res2=matchText(PRINTERS,"Printers (0)")
    res3=matchText(SCANNERS,"Scanners (0)")
    res4=matchText(MONITORS,"Monitors (2)")
    res5=matchText(WEB_CAMERAS,"Web Cameras (0)")
    res6=matchText(SHOW_ALL_COMPONENTS,"Show All Components")
    if(!res1 || !res2 || !res3 || !res4 || !res5 || !res6)
      return false
    end
    puts "submenu for components verified"
    return true
  end

  def submenu_for_mp3player
    @driver.find_element(MP3).click
    res1=matchText(TEST4,"test 4 (0)")
    res2=matchText(TEST5,"test 5 (0)")
    res3=matchText(TEST6,"test 6 (0)")
    res4=matchText(TEST7,"test 7 (0)")
    res5=matchText(TEST8,"test 8 (0)")
    res6=matchText(TEST9,"test 9 (0)")
    res7=matchText(TEST11,"test 11 (0)")
    res8=matchText(TEST12,"test 12 (0)")
    res9=matchText(TEST15,"test 15 (0)")
    res10=matchText(TEST16,"test 16 (0)")
    res11=matchText(TEST17,"test 17 (0)")
    res12=matchText(TEST18,"test 18 (0)")
    res13=matchText(TEST19,"test 19 (0)")
    res14=matchText(TEST20,"test 20 (0)")
    res15=matchText(TEST21,"test 21 (0)")
    res16=matchText(TEST22,"test 22 (0)")
    res17=matchText(TEST23,"test 23 (0)")
    res18=matchText(TEST23,"test 23 (0)")
    res19=matchText(TEST23,"test 23 (0)")
    res20=matchText(TEST24,"test 24 (0)")
    res21=matchText(SHOW_ALL_MP3PLAYERS,"Show All MP3 Players")
    if(!res1 || !res2 || !res3 || !res4 || !res5 || !res6 || !res7 || !res8 ||!res9 || !res10 || !res11 || !res12 || !res13 || !res14 || !res15 || !res16||!res17 || !res18 || !res19 || !res20 || !res21)
      return false
    end
    puts "submenu for mp3 players verified"
    return true
  end

 end
