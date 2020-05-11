class Assertion

  def validateURL(driver,expected_url)
    result = false
    if(driver.current_url.eql?expected_url)
      result = true
    end
    return result
  end

  def verify_page_title(driver,page_title)
      result = false
    if (driver.title.eql?page_title)
      result = true
    else
      return result
    end
  end
end