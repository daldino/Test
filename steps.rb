require 'rubygems'
require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox
Given('I open practiceselenium hompage') do
  driver.navigate.to "http://www.practiceselenium.com/"
end

Then('I See tea collection') do
  driver.find_element(:id,'wsb-button-00000000-0000-0000-0000-000450914890').click()
end

Then('I Pick the tea') do
  driver.find_element(:id,'wsb-button-00000000-0000-0000-0000-000451955160').click()
end

Then('I Fill out customer and payment info') do
  driver.find_element(:id=>'email').send_keys("testing@testing.com")
  driver.find_element(:id=>'name').send_keys("testing")
  driver.find_element(:id=>'address').send_keys("jl.testing,km.testing ")
  driver.find_element(:id=>'card_type').send_keys("Visa")
  driver.find_element(:id=>'card_number').send_keys("0101010101010111")
  driver.find_element(:id=>'cardholder_name').send_keys("Testing")
  driver.find_element(:id=>'verification_code').send_keys("111")
end

Then('I click Place order') do
  driver.find_element(:xpath,'//*[@id="wsb-element-00000000-0000-0000-0000-000452010925"]/div/div/form/div/button').click()
end
