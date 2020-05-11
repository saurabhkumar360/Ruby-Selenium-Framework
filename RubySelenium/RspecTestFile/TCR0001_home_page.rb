require 'rspec'
require_relative '../Core/helper'
require_relative '../Assertion/assertion'
require_relative '../Pages/home_page'
require_relative '../library/Proj_lib'

describe('Verify the home page')  do
  page = nil;

  it 'Verify the page URL' do
    result = assertion.validateURL(@@driver,'http://opencart.abstracta.us/')
    assert_true(result, '[Failed]')
  end
 end

