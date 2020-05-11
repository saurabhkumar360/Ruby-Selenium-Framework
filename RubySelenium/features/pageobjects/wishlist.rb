class WishList

  #===================================================================
  HEADING_GRID = {css: 'div#content h2'}
  ADDCART_IN_GRID = {css: 'div.table-responsive button.btn-primary'}
  REMOVE_IN_GRID = {css: 'div.table-responsive a.btn-danger'}
  #===================================================================
  def initialize(driver)
    @driver = driver
  end

  def get_heading_grid()
    element = @driver.find_element(HEADING_GRID)
    WaitHelper.wait_element_clickable(element)
    return element.text
  end

  def click_addtocart_grid()
    @driver.find_element(ADDCART_IN_GRID).click
    puts "Clicked on ADD TO CART button in wishlist grid"
  end

  def click_remove_grid()
    @driver.find_element(REMOVE_IN_GRID).click
    puts "Clicked on REMOVE button in wishlist grid"
  end

  def item_is_displaying(itemname)
    return @driver.find_element({xpath: '//*[text()="'+itemname+'"]'}).displayed?
  end
end