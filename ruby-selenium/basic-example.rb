#filename: basic-example.rb

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

def fill_login_form
  element = @driver.find_element(:id, 'VaultAccountNumber')
  element.send_keys 'Hello WebDriver!'
  password_field = @driver.find_element(:id, 'LoginPassword')
  password_field.send_keys 'password'
  wait
  submit_button = @driver.find_element(:id, 'Venge_Submit')
  submit_button.click

  wait
  title = @driver.title
  expected_title = 'Play Online Casino Games, Bet on Live Sports and Join Poker Tournaments - only at Betway'

  RSpec.describe 'Main page title' do
    it 'is equal to another string of the same value' do
      expect(title).to eq(expected_title)
    end
  end
end

run do
  @driver.get 'http://betway.com'
  wait
  fill_login_form
end
