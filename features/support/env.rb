# This file provides setup and common functionality across all features.  It's
# included first before every test run, and the methods provided here can be
# used in any of the step definitions used in a test.  This is a great place to
# put shared data like the location of your app, the capabilities you want to
# test with, and the setup of selenium.

require 'rspec/expectations'
require 'appium_lib'
require_relative 'server'
require_relative '../pages/base_page'

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

options = {
  'port' => 5500,
  'portboot' => 5051,
  'sn' => 'BYJDU17511001133',
  'app' => 'app.apk',
  'appPackage' => 'com.testdevlab.notifyus'
}
server = Server.new(options)
server.reinstall_app
server.start
# p `nmap -p 5551 localhost`
sleep(10) # TODO replace with server up validaton
# TODO move desired caps to config file
desired_capabilities = {
  'deviceName' => options['sn'],
  'platformName' => 'Android',
  'appActivity' => 'com.testdevlab.notifyus.activities.MainActivity',
  'appPackage' => options['appPackage'],
  'noReset' => 'True'
  # 'app' => options['app']
  # 'app' => options['app']
}
# TODO get rid of global $driver variable
$driver = Appium::Driver.new(caps: desired_capabilities, appium_lib: { server_url: "http://localhost:#{options['port']}/wd/hub" })
World do
  AppiumWorld.new
end

Before do
  @pages = Pages.new
  $driver.start_driver
end
After do
  $driver.driver_quit
end

at_exit do
  server.stop
end
