require 'selenium-webdriver'
require 'appium_lib'
require 'byebug'
opts = {
        caps: {
            deviceName: "emfuscde999tmfa6",
            platformVersion: "10",
            appPackage: "id.co.myhomecredit",
            appActivity: "id.co.homecredit.v2.launcherpage.SplashScreenActivity",
            udid: "emfuscde999tmfa6",
            platformName: "Android",
            noReset: "true",
              },
            appium_lib: {
              wait_timeout: 30,
              wait_interval: 1
            }
        }

        appium_driver = Appium::Driver.new(opts, true)
        Given('I Open Homecredit Apps') do
          begin
            appium_driver.start_driver
          end
        end

        Then('I Swipe right three times') do
          begin
            sleep(5)
            Appium::TouchAction.new.press(x: 1014, y: 1024).wait(100).move_to(x: 106, y: 1024).release.perform
            sleep(2)
            Appium::TouchAction.new.press(x: 1014, y: 1024).wait(100).move_to(x: 106, y: 1024).release.perform
            sleep(2)
            Appium::TouchAction.new.press(x: 1014, y: 1024).wait(100).move_to(x: 106, y: 1024).release.perform
            sleep(2)
          end
        end

        Then('I click Daftar') do
          begin
            appium_driver.find_element(:id, "id.co.myhomecredit:id/button_register").click
            sleep(5)
          end
        end

        Then('I Setuju dan lanjutkan') do
          begin
            sleep(5)
            Appium::TouchAction.new.press(x: 498, y: 2070).wait(100).move_to(x: 498, y: 402).release.perform
            sleep(8)
            Appium::TouchAction.new.press(x: 498, y: 2070).wait(100).move_to(x: 498, y: 402).release.perform
            sleep(8)
            appium_driver.find_element(:id, "id.co.myhomecredit:id/agree_button").click
          end
        end
        Then('I fill the form') do
          sleep(5)
          begin
            appium_driver.find_element(:xpath, "//android.widget.Spinner[@resource-id='dateOfBirth']").click
            appium_driver.find_element(:xpath, "//android.widget.CheckedTextView[@text='27']").click
            appium_driver.find_element(:xpath, "//android.widget.Spinner[@resource-id='monthOfBirth']").click
            appium_driver.find_element(:xpath, "//android.widget.CheckedTextView[@text='Oktober']").click
            appium_driver.find_element(:xpath, "//android.widget.Spinner[@resource-id='yearOfBirth']").click
            appium_driver.find_element(:xpath, "//android.widget.CheckedTextView[@text='2010']").click
            sleep(2)
            appium_driver.find_element(:xpath, "//android.widget.EditText[@resource-id='phoneInput']").send_keys("81289385976")
            appium_driver.find_element(:xpath, "//android.widget.EditText[@resource-id='kodePin']").send_keys("271097")
            appium_driver.find_element(:xpath, "//android.widget.EditText[@resource-id='kodePinConfirm']").send_keys("271097")
            appium_driver.find_element(:xpath, "//android.widget.Button[@resource-id='registerButton']").click
          end
        end

        Then('I click lanjutkan') do
          sleep(2)
          begin
            appium_driver.find_element(:xpath, "//android.widget.Button[@resource-id='agreePopUp']").click
            sleep(5)
          end
        end

        Then('I input OTP') do
        begin
            sleep(10)
            appium_driver.background_app(-1)
            sleep(2)
            appium_driver.find_element(:accessibility_id => "Messaging").click
            sleep(2)
            appium_driver.find_element(:xpath => "//com.android.mms[@text='HOME CREDIT']").click
            sleep(2)
            text = appium_driver.find_element(:xpath => "(//android.widget.TextView[@resource-id='com.android.mms:id/message_body'])[5]").text
            numeric = text.gsub(/\D/,'')
            numeric_arr = numeric.split('')
            new_arr = []
            for i in 0..5
              new_arr << numeric_arr[i]
            end

            puts "OTP: #{new_arr}"
            sleep(2)
            appium_driver.launch_app
            sleep(3)
            appium_driver.find_element(:xpath => "//android.widget.EditText[@resource-id='otp-1']").send_keys(new_arr[0])
            sleep(1)
            appium_driver.find_element(:xpath => "//android.widget.EditText[@resource-id='otp-2']").send_keys(new_arr[1])
            sleep(1)
            appium_driver.find_element(:xpath => "//android.widget.EditText[@resource-id='otp-3']").send_keys(new_arr[2])
            sleep(1)
            appium_driver.find_element(:xpath => "//android.widget.EditText[@resource-id='otp-4']").send_keys(new_arr[3])
            sleep(1)
            appium_driver.find_element(:xpath => "//android.widget.EditText[@resource-id='otp-5']").send_keys(new_arr[4])
            sleep(1)
            appium_driver.find_element(:xpath => "//android.widget.EditText[@resource-id='otp-6']").send_keys(new_arr[5])
            sleep(1)
            appium_driver.find_element(:xpath, "//android.widget.Button[@text='Daftar']").click


        end

        Then('I Direct to Home') do
          sleep(5)
          appium_driver.find_element(:xpath, "//android.widget.ImageView[@resource-id='id.co.myhomecredit:id/menuAccount']")

        end
