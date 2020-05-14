# frozen_string_literal: true

require 'selenium-webdriver'

class Checkout
  #=============================================LOCATOR======================================================
  CHECKBOX = { xpath: "//input[@type='checkbox']" }.freeze
  AMOUNT = { xpath: "//*[text()='Total:']/../..//td[2]" }.freeze
  QUANTITY = { css: '.table-responsive>table>tbody>tr>td:nth-child(3)' }.freeze
  HEADER = { css: '.col-sm-12>h1' }.freeze

  def continueButton(index)
    { xpath: "(//input[@type='button'])[" + index + ']' }.freeze
  end

  def breadcrumb(index)
    { css: '.breadcrumb>li:nth-child(' + index + ')>a' }.freeze
  end

  #======================================================METHOD=============================================

  def checkout_items
    $helper = Helper.new
    x=1
    while x<5
      $helper.time_out(2)
      result = $driver.find_elements(CHECKBOX).size()>0
      puts(result)
      if (result)
        $helper.wait_for_element(30) { $driver.find_element(CHECKBOX).displayed? }
        $driver.find_element(CHECKBOX).click
        $driver.find_element(continueButton(x.to_s)).click
      else
        $helper.wait_for_element(30) { $driver.find_element(continueButton(x.to_s)).displayed? }
        $driver.find_element(continueButton(x.to_s)).click
      end
      x+=1
    end
  end

  def orderAmount
    amount = $driver.find_element(AMOUNT).text
    amount
  end

  def quantity
    quantity = $driver.find_element(QUANTITY).text
    quantity
  end

  def confirmOrder
    $driver.find_element(continueButton(5.to_s)).click
    $helper.wait_for_element(30) { $driver.find_element(breadcrumb(4.to_s)).displayed? }
    $driver.find_element(HEADER).text.include?('Your order has been placed!')
  end
end
