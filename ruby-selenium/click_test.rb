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

def wait
  Selenium::WebDriver::Wait.new(timeout: 10)
end

def inplay
  inplay_link = @driver.find_element(class_name: 'inplay')
  inplay_link.click

  wait
  in_play_page_title = @driver.title
  expected_inplay_page_title = 'Bet In-Play at Betway Sports'

  RSpec.describe 'In-Play page title' do
    it 'is equal to another string of the same value' do
      expect(in_play_page_title).to eq(expected_inplay_page_title)
    end
  end
end

def casino
  casino_link = @driver.find_element(class_name: 'casino')
  casino_link.click

  wait
  casino_page_title = @driver.title
  expected_casino_page_title = 'Play at Betway – The Best Online Casino with a Huge Selection of Games!'

  RSpec.describe 'casino page title' do
    it 'is equal to another string of the same value' do
      expect(casino_page_title).to eq(expected_casino_page_title)
    end
  end
end

run do
  @driver.get 'http://sports.betway.com'
  wait

  inplay
  wait
  casino

end
