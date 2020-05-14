# frozen_string_literal: true

Given(/^User login to the application$/) do
  @home=Home.new
  @login=Login.new
  @home.navigate_to_loginPage
  @login.loginPage('dummy@mailinator.com','cart123')
  
end

When(/^User add items to the cart$/) do
  @cart=Cart.new
  @home.add_to_cart('iPod Touch')
  @cart.verify_shoppingCart_page
end

And(/^User checkout the items added in the cart$/) do
  @checkout=Checkout.new
  @checkout.checkout_items
  @quantity=@checkout.quantity
  @amount=@checkout.orderAmount
  @checkout.confirmOrder
end

Then(/^User navigate towards order history page$/) do
  @orderHistory=OrderHistory.new
  @orderHistory.navigate_to_orderhistory
end

And(/^Items should be present on order history page$/) do
  @orderHistory.verify_orderHistory_page(@quantity,@amount)
end
