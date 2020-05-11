
When("User enter the search items") do
  @homePage = HomePage.new($driver)
  @homePage.navigate_opencart_homepage
  @homePage.enter_search_value 'iphone'
end

When("User click on search Items") do
  @homePage.click_search_icon
end

Then("user navigate on search result page") do
  @homePage.click_my_account
  @homePage.click_login
  puts 'Success'
  sleep 5
end