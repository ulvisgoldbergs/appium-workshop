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

p ENV['port']
p ENV['boot_port']
p ENV['sn']
p ENV['apk']
options = {
  'port' => ENV['port'],
  'portboot' => ENV['boot_port'],
  'sn' => ENV['sn'],
  'app' => ENV['apk'],
  'appPackage' => 'com.testdevlab.notifyus'
}
server = Server.new(options)
server.reinstall_app
server.start
server.wait_to_boot
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
  $filters ||= Filters
  @tests = Tests.new(@pages, $filters)
  $driver.start_driver
end
After do
  $driver.driver_quit
end

at_exit do
  server.stop
end
