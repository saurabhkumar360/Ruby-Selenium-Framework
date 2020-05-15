When("Go to product details page") do
  $driver.find_element(xpath: "(//a[@class='dropdown-toggle'])[2]").click
  $driver.find_element(xpath: "(//a[@class='see-all'])[1]").click
  $driver.find_element(xpath: "//img[@title='HP LP3065']").click
end

When("Add the item to the cart") do
  $driver.find_element(css: '#input-option225').send_keys('2011-04-22')
  $driver.find_element(css: '#input-quantity').send_keys(2)
  $driver.find_element(css: 'button#button-cart').click
end

When("Go to the Shopping cart page") do
  $driver.find_element(css: 'span#cart-total').click
  $driver.manage.timeouts.implicit_wait = 30
  $driver.find_element(xpath: "(//p[@class='text-right']/a)[1]").click
end

Then("Added item is showing in the Shopping cart") do
  itemtext = $driver.find_element(xpath: "(//td[@class='text-left']/a)[2]").text
  if(itemtext == 'HP LP3065')
  puts 'Item is showing in the cart'
  else
    puts 'Item is not showing in the cart'
    end
end


