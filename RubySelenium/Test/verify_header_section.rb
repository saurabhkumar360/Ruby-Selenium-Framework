require "selenium-webdriver"
require_relative "../Templates/home_page"
require_relative "../Helper/helper"



#---------------------------------------------------------------------------------------------------------------
chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$driver = Selenium::WebDriver.for :chrome
#-----------------------------------------------------------------------------------------------------------------
page = OPENCART.new($driver)
puts('Start Browser')
page.start_browser

page.header_section_elements
puts('Header section verified')

page.submenu_for_desktops
puts('Submenu for Desktops verified')

page.submenu_for_laptops_and_notebooks
puts('Submenu for laptop and notebooks verified')

page.submenu_for_components
puts('Submenu for components has been varified')

page.submenu_for_mp3player
puts('Submenu for MP3 Players has been verified')