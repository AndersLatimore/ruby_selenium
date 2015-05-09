# filename: dropdown.rb

require 'selenium-webdriver'
require 'rspec'

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'http://betway.com'
  sleep(2)

  dropdown = @driver.find_element(tag_name: 'select')
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  select_list.select_by(:text, 'Swedish')

  sleep(2)

  new_page_title = @driver.title

  RSpec.describe "new page title" do
    it 'is equal to another string of the same value' do
      expect(new_page_title).to eq('Casino, Odds, Livesport och Pokerturneringar - hos Betway hittar du allt')
    end
  end
end