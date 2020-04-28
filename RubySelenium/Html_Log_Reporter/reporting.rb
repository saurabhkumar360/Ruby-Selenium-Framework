require 'selenium-webdriver'
require 'allure-rspec'
require 'uuid'

RSpec.configure do |config|
  config.include AllureRSpec::Adaptor

  config.before(:each) do
    chromedriver_path = File.join(File.absolute_path('.', File.dirname(__FILE__)),"../drivers","chromedriver.exe")
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
    $driver = Selenium::WebDriver.for :chrome
  end

  config.after(:each) do |example|
    if example.exception
      example.attach_file('screenshot', File.new(
                                          $driver.save_screenshot(
                                              File.join(Dir.pwd, "results/#{UUID.new.generate}.png"))))
    end

    $driver.quit
  end
end

AllureRSpec.configure do |config|
  config.output_dir = 'results'
  config.clean_dir = true # this is the default value
end