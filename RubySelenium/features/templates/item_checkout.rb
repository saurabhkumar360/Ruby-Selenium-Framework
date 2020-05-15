

class CHECKOUT

#========================LOCATORS=====================================================================================

  VERIFYITEMNAME = {xpath: "(//a[text()='HP LP3065'])[2]"}
  BTN_CHECKOUT = {xpath: "//a[text()='Checkout']"}
  QTY_FIELD = {css: "td.text-left>div>input"}


#========================METHODS=====================================================================================
  $qty= 5

  def verifyItemDetails

    $helperpage.isElementDisplay(VERIFYITEMNAME)
    $helperpage.isElementDisplay(BTN_CHECKOUT)
    value = $helperpage.findElement(QTY_FIELD).text
    value.equal?($qty)
    puts ('Entered Quntity Verified..!')
  end


end




