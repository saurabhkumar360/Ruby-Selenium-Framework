require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require 'json'
require_relative "../Helper/helper"
#-------------------------------------------------------------------------------------

class ITEMDETAILS

   ITEMNAME   = {xpath: "//a[text()='HP LP3065']"}
   QUANTITYFIELD = {css: "input#input-quantity"}
   BTN_ADDTOCART = {css: "button#button-cart"}
   SUCC_ADDTOCART = {css: "div.alert"}
   LINK_SHOPINGCART = {css: "ul.list-inline >:nth-child(4) > a>i"}
   VERIFYITEMNAME = {xpath: "(//a[text()='HP LP3065'])[2]"}
   BTN_CHECKOUT = {xpath: "//a[text()='Checkout']"}
   QTY_FIELD = {css: "td.text-left>div>input"}




#========================METHODS=====================================================================================
 $qty= 5
  def initialize(driver)
    @driver = driver
  end

  def clickOnItem
    $helperpage = HELPER.new(@driver);
    $helperpage.maximize_window
    $helperpage.findElement(ITEMNAME).click

  end

  def clickOnAddToCart
    $helperpage.findElement(BTN_ADDTOCART).click
  end
  def enterQuantity
    $helperpage.findElement(QUANTITYFIELD).clear
    $helperpage.findElement(QUANTITYFIELD).send_keys($qty)
  end

  def addItemOnCart
    clickOnItem
    enterQuantity
    clickOnAddToCart
    $helperpage.isElementDisplay(SUCC_ADDTOCART)

  end

  def navigateToShopingCart
     shpCart = $helperpage.findElement(LINK_SHOPINGCART)
     $helperpage.clickUsingJS(shpCart)
  end

  def verifyItemDetails
    $helperpage.isElementDisplay(VERIFYITEMNAME)
    $helperpage.isElementDisplay(BTN_CHECKOUT)
    value = $helperpage.findElement(QTY_FIELD).text
    value.equal?($qty)
    puts ('Entered Quntity Verified..!')
  end




end