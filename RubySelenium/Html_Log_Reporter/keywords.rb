require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require 'rexml/document'
require_relative "html_reporter";
include REXML
$driver
def openBrowser
create_report()
insert_head_title("Automation HTML Report")
insert_reportname_date("TestReport",$result_date )
start_table
chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
$driver = Selenium::WebDriver.for :chrome
$driver.manage.window.maximize
$driver.manage.timeouts.implicit_wait = 30
report_row("OpenBrowser","Browser launched Successfully","PASS","")
end 

def go(url)
$driver.navigate.to url
report_row("GO","Url Set Successfully","PASS","")
end

def click(element)
element.click
report_row("Click","Element Clicked Successfully","PASS","")
end

def type(element,text)
element.send_keys text
report_row("Type","Text Typed Successfully","PASS","")
end

def quit
$driver.quit
report_row("Quit","Browser Closed Successfully","PASS","")
close_table
summary_report(1,1,1)
end

def waitForElement(element,time)
wait = Selenium::WebDriver::Wait.new(timeout: time) # seconds
wait.until { element }
end 

def getText(element)
element.text
end 

def getWebElement(locator)
if(locator.start_with?("name"))
 finalval=locator.split("=")
 element= $driver.find_element(name:finalval.at(1))		
elsif(locator.start_with?("id"))
 finalval=locator.split("=")
 element= $driver.find_element(id:finalval.at(1))	
elsif(locator.start_with?("class"))
 finalval=locator.split("=")
 element= $driver.find_element(class:finalval.at(1))	
elsif(locator.start_with?("id"))
 finalval=locator.split("=")
 element= $driver.find_element(linktext:finalval.at(1))	
elsif(locator.start_with?("//")|| (locator.start_with?("(")))
    element= $driver.find_element(xpath:finalval)	
else
		puts "not matched"
end
 return element
end 

def getLocator(locatorPath)
xmlfile = File.new($filePath)
xmldoc = Document.new(xmlfile)
locator = XPath.first(xmldoc,locatorPath)
return locator.text
end


