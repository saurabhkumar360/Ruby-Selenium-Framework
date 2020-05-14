require 'selenium-webdriver'
require 'test-unit'
require_relative '../Core/helper'
require_relative '../Pages/home_page'

class TC003 < Core
  def test_header_menu
    page = Home_Page.new(@@driver)
    res=page.header_section_elements
    assert_true(res,'[Error] header element mismatch')
    res=page.submenu_for_desktops
    assert_true(res,'[Error] desktop submenu element mismatch')
    res=page.submenu_for_laptops_and_notebooks
    assert_true(res,'[Error] laptop and notebooks submenu element mismatch')
    res=page.submenu_for_components
    assert_true(res,'[Error] component submenu element mismatch')
    res=page.submenu_for_mp3player
    assert_true(res,'[Error] MP3 player submenu element mismatch')
  end
end
