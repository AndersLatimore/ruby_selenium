require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://betway.com"

sleep(10)

element = driver.find_element(:id, 'VaultAccountNumber')
element.send_keys "Hello WebDriver!"

passwordField = driver.find_element(:id, 'LoginPassword')
passwordField.send_keys "password"

sleep(5)

submitButton = driver.find_element(:id, 'Venge_Submit')
submitButton.click

sleep(5)

puts driver.title

driver.quit
