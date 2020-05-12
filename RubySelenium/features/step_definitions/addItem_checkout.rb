

Given(/^User should on application home page$/) do
  @validate = Assert.new
  @validate.validateURL($driver,'http://opencart.abstracta.us/')
  @validate.verify_title($driver,'Your Store')
end

When(/^User should able to see all DeskTop items$/) do
  @pages =  HOOMEPAGE.new
  puts 'Hover on Desktop Tab'
  @pages.hoverOnDesktopBtnandClick
  @validate.verify_title($driver, 'Desktops')

end

Then(/^User  should able to select particular item$/) do
  @itemdetail = ITEMDETAILS.new
  puts 'Select one item'
  @itemdetail.clickOnItem
  @validate.verify_title($driver, 'HP LP3065')

end

And(/^After enter all details , User can add item on cart$/) do
  puts 'Add item on cart'
  @itemdetail.addItemOnCart
  puts 'Navigate to shopping cart'
  @itemdetail.navigateToShopingCart
  @validate.verify_title($driver, 'Shopping Cart')


end

Then(/^after add item ,added item should display for checkout$/) do
   puts 'Verify item detals on checkout page '
   @checkout = CHECKOUT.new
   @checkout.verifyItemDetails
end