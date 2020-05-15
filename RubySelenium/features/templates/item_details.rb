

class ITEMDETAILS

  #========================LOCATORS=====================================================================================

  ITEMNAME   = {xpath: "//a[text()='HP LP3065']"}
  QUANTITYFIELD = {css: "input#input-quantity"}
  BTN_ADDTOCART = {css: "button#button-cart"}
  SUCC_ADDTOCART = {css: "div.alert"}
  LINK_SHOPINGCART = {css: "ul.list-inline >:nth-child(4) > a>i"}

#========================METHODS=====================================================================================
  $qty= 5



  def clickOnItem
    $helperpage = ELEMENTHELPER.new()
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
    enterQuantity
    clickOnAddToCart
    $helperpage.time_out
    $helperpage.isElementDisplay(SUCC_ADDTOCART)

  end

  def navigateToShopingCart
    shpCart = $helperpage.findElement(LINK_SHOPINGCART)
    $helperpage.clickUsingJS(shpCart)
  end


end