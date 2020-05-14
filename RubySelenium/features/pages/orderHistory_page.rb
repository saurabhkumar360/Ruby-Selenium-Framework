# frozen_string_literal: true

class OrderHistory
  #======================================================LOCATOR=========================================
  HEADING = { css: '.col-sm-9>h1' }.freeze
  MY_ACCOUNT_DROPDOWN = { css: '.caret' }.freeze
  VIEW = { css: '.text-right>a>i' }.freeze

  def breadcrumb(index)
    { css: '.breadcrumb>li:nth-child(' + index + ')>a' }.freeze
  end

  def dropdown_value(index)
    { css: '.list-inline>li>ul>li:nth-child(' + index + ')' }.freeze
  end

  def order_info(locator_value, index)
    { css: '.table-responsive>table>' + locator_value + '>tr>td:nth-child(' + index + ')' }.freeze
  end

  #=======================================================METHOD============================================
  def navigate_to_orderhistory
    $driver.find_element(MY_ACCOUNT_DROPDOWN).click
    $driver.find_element(dropdown_value(2.to_s)).click
  end

  def verify_orderHistory_page(quantity, amount)
    $driver.find_element(breadcrumb(3.to_s)).text.include?('Order History')
    $driver.find_element(HEADING).text.include?('Order History')
    $driver.find_element(order_info('thead', 1.to_s)).text.include?('Order ID')
    $driver.find_element(order_info('thead', 2.to_s)).text.include?('Customer')
    $driver.find_element(order_info('thead', 3.to_s)).text.include?('No. of Products')
    $driver.find_element(order_info('thead', 4.to_s)).text.include?('Status')
    $driver.find_element(order_info('thead', 5.to_s)).text.include?('Total')
    $driver.find_element(order_info('thead', 6.to_s)).text.include?('Date Added')
    $driver.find_element(order_info('tbody', 1.to_s)).text.include?('#3588')
    $driver.find_element(order_info('tbody', 2.to_s)).text.include?('dummy user')
    $driver.find_element(order_info('tbody', 3.to_s)).text.include?(quantity)
    $driver.find_element(order_info('tbody', 4.to_s)).text.include?('Pending')
    $driver.find_element(order_info('tbody', 5.to_s)).text.include?(amount)
    $driver.find_element(order_info('tbody', 6.to_s)).text.include?($helper.current_day.to_s)
    $driver.find_element(VIEW).displayed?
  end
end
