# These are the 'step definitions' which Cucumber uses to implement features.
#
# Each step starts with a regular expression matching the step you write in
# your feature description.  Any variables are parsed out and passed to the
# step block.
#
# The instructions in the step are then executed with those variables.
#
# In this example, we're using rspec's assertions to test that things are happening,
# but you can use any ruby code you want in the steps.
#
# The '$driver' object is the appium_lib driver, set up in the cucumber/support/env.rb
# file, which is a convenient place to put it as we're likely to use it often.
# This is a different use to most of the examples;  Cucumber steps are instances
# of `Object`, and extending Object with Appium methods (through
# `promote_appium_methods`) is a bad idea.
#
# For more on step definitions, check out the documentation at
# https://github.com/cucumber/cucumber/wiki/Step-Definitions
#
# For more on rspec assertions, check out
# https://www.relishapp.com/rspec/rspec-expectations/docs


Given /^I am on intro screen$/ do
 @tests.test_intro.intro_visible?
end

Given /^I have opened create filter screen$/ do
  @tests.test_intro.close_intro
end

Given /^I create property filter$/ do
 @tests.test_add_filter.create_filter
end

Given /^I create positive transport filter/ do
  @tests.test_add_filter.choose_filter('transports_positive')
end

Given /^I create negative transport filter/ do
  @tests.test_add_filter.choose_filter('transports_negative')
end

Given /^I create positive vacancy filter/ do
  @tests.test_add_filter.choose_filter('vakances_positive')
end

Given /^I create negative vacancy filter/ do
  @tests.test_add_filter.choose_filter('vakances_negative')
end

Given /^I create my first filter/ do
  @tests.test_add_filter.choose_filter('property_positive')
end
