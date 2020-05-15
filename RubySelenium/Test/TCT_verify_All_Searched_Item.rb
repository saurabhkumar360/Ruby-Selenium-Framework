require 'selenium-webdriver'
require 'test-unit'
require_relative '../Core/helper'
require_relative '../Pages/home_page'
require_relative '../Assertion/assertion'

class VERIFYALLITEM < Core
  def test_verify_home_page
    page = Home_Page.new(@@driver)
    validate = Assertion.new
    res = validate.validateURL(@@driver,'http://opencart.abstracta.us/')
    assert_true(res,'[Error] not the correct url')
    title = validate.verify_page_title(@@driver,'Your Store')
    assert_true(title,'[Error] wrong title')

    puts ('Hover on Desktop Tab')
    page.hoverOnDesktopBtnandClick

    puts('Get total number of count of search items')
    page.getTotalNumOfItems

    puts('Verify Search items')
    page.verifySearchItems

    puts('Print each item name:')
    page.getTextForALLElement

  end

end
