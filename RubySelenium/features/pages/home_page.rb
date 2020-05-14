class Home
  #==============================================LOCATOR==================================================
  MY_ACCOUNT_DROPDOWN = { css: '.caret' }.freeze
  SEARCH_BOX  = { css: 'div.input-group > input'  }
  SEARCH_BOX_BUTTON = {css:'span.input-group-btn > button'}
  def item_selection_option(index)
    { css: '.button-group>button:nth-child('+ index +')>i' }.freeze
  end

  def top_navigation(index)
    { css: '.list-inline>li:nth-child('+ index +')>a' }.freeze
  end

  def dropdown_value(index)
    { css: '.list-inline>li>ul>li:nth-child(' + index + ')' }.freeze
  end
  #=================================================METHOD===================================================
  def navigate_to_loginPage
    $driver.manage.window.maximize
    $driver.find_element(MY_ACCOUNT_DROPDOWN).click
    $driver.find_element(dropdown_value(2.to_s)).click
  end

  def add_to_cart(search_term)
    $driver.find_element(SEARCH_BOX).clear
    $driver.find_element(SEARCH_BOX).send_keys search_term
    $driver.find_element(SEARCH_BOX_BUTTON).click
    $driver.find_element(item_selection_option(1.to_s)).click
    $driver.find_element(top_navigation(4.to_s)).click
  end
end
