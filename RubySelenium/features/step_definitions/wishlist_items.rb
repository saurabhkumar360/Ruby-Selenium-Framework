include Test::Unit::Assertions

Given(/^I am on login page$/) do
  @loginPage = LoginPage.new($driver)
  @homePage = HomePage.new($driver)
  @homePage.click_my_account
  @homePage.click_login
end

And(/^I entered valid credentials$/) do
  @loginPage.fillLoginPage ConfigFileReader.get_user_name, ConfigFileReader.get_password
end

When(/^I added item to wishlist$/) do
  @phonePdas = 'Phones & PDAs'
  @item = 'iPhone'
  @homePage.click_by_text @phonePdas
  @homePage.click_by_text @item
  puts "Added item to the wishlist"
end

And(/^I clicked on Wishlist link in top nav$/) do
  @homePage.click_add_to_wishList
  puts @homePage.get_wishlist_added_msg
  sleep 3
  @homePage.click_by_text 'Wish List'
  puts "Navigate to Wish List page."
end

Then(/^I found heading of grid as "([^"]*)"$/) do |arg|
  @wishList = WishList.new($driver)
  msg = @wishList.get_heading_grid
  assert_equal msg, arg
  puts "Verified heading of grid : #{arg}"
end

And(/^I found wishlist grid heading$/) do |table|
  # table is a table.hashes.keys # => [:Image]
  data = table.raw
  data.each { |value|
    assert_equal @wishList.item_is_displaying(value[0]), true
  }
end

And(/^I found the item in My Wish List grid$/) do
  assert_equal @wishList.item_is_displaying(@item), true
  puts "Verified #{@item} is displaying on wishlist page."
end