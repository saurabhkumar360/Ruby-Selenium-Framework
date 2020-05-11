
When("User enter the search items") do
  @@driver.find_element(css: 'div.input-group > input').send_keys('iphone')
end

When("User click on search Items") do
  @@driver.find_element(css:'span.input-group-btn > button').click
end

Then("user navigate on search result page") do
  puts 'Success'
end