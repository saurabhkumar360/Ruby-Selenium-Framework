class Assert

  def validateURL(driver,expected_url)
    result = false
    if(driver.current_url.eql?expected_url)
      result = true
      puts ('User is in correct URL')
    end
    return result
  end

  def verify_title(driver,page_title)
    result = false
    if (driver.title.eql?page_title)
      result = true
      puts ('Page title is correct')
    else
      puts ('Page title is wrong')
      return result
    end
  end



end