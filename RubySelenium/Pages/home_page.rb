require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require 'rspec'
#-------------------------------------------------------------------------------------
class Home_Page

  DesktopTab          = {xpath: "(//a[contains(text(),'Desktops')])[1]"}
  ShowAllComponents   = {xpath: "(//*[@class='see-all'])[1]"}
  SearchedItem        = {css: "div.caption>h4>a"}
  TotalSearchedItems  = {xpath: "//a[contains(text(),'Desktops ')]"}

#-------------------------------Locators for header section------------------------------------------

  def initialize(driver)
    @driver = driver
  end

    def hoverOnDesktopBtnandClick
      $helperpage = Core.new(@driver);
      $helperpage.hoverOnElement($helperpage.findElement(DesktopTab))
      $helperpage.time_out
      $helperpage.findElement(ShowAllComponents).click
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