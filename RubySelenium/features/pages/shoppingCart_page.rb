class Cart
  SHOPPING_CART = {css:'.table-responsive>table'}
  PRODUCTNAME = {css: '.table-responsive>table>tbody>tr>td:nth-child(2)>a'}
  CHECKOUT = {css: '.pull-right>a'}

  def verify_shoppingCart_page
    $driver.find_element(SHOPPING_CART).displayed?
    productAdded=$driver.find_element(PRODUCTNAME).text
    if productAdded=='iPod Touch'
      puts "Product is added to cart successfully"
      $driver.find_element(CHECKOUT).click
    else
      puts "Product is not added to cart"
    end
  end
end
