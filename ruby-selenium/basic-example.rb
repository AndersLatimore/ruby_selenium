require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to 'http://betway.com'

sleep(10)

element = driver.find_element(:id, 'VaultAccountNumber')
element.send_keys 'Hello WebDriver!'

password_field = driver.find_element(:id, 'LoginPassword')
password_field.send_keys 'password'

sleep(5)

submit_button = driver.find_element(:id, 'Venge_Submit')
submit_button.click

sleep(5)

puts driver.title

driver.quit
