

Given(/^I am at home page$/)do
  @HomePage = HomePage.new($driver)

end

When(/^I choose currency$/) do
  @HomePage.choose_currency("EURO")
  puts "Currency choosen"
end

Then(/^I check price of items displayed are in choosen curency$/) do
  @HomePage.check_currency
  puts "Displayed items have price with choosen currency"
end

