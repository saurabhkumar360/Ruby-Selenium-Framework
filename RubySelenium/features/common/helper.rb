# frozen_string_literal: true

require 'selenium-webdriver'
require 'date'

class Helper
  #==============================================METHOD=========================================================
  def wait_for_element(time)
    Selenium::WebDriver::Wait.new(timeout: time).until { yield }
  end

  def time_out(timeout)
    $driver.manage.timeouts.implicit_wait = timeout
  end

  def get_text(element)
    $driver.find_element(element).text
  end

  def current_day()
    date = Time.new
    #format will be displayed as DD/MM/YYYY
    date = date.day.to_s + "/" + date.month.to_s + "/" + date.year.to_s
    puts date
  end
end
