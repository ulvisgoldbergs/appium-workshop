Given /^I am on intro screen$/ do
  @tests.test_intro.intro_visible?
end

Given /^I have opened create filter screen$/ do
  @tests.test_intro.close_intro
end

Given /^I create correct landline filter$/ do
  @tests.test_add_filter.set_filter('property_positive')
  @tests.test_add_filter.create_filter
end

Given /^I create correct transport filter$/ do
  @tests.test_add_filter.set_filter('transport_positive')
  @tests.test_add_filter.create_filter
end

Given /^I create incorrect transport filter$/ do
  @tests.test_add_filter.set_filter('transport_negative')
  @tests.test_add_filter.create_filter
end

Then /^I check if I am on filter parameter screen$/ do
  @tests.test_filter_existance.check_screen
end

Given /^I validate created filter$/ do
  @tests.test_filter_existance.check_filter_existance
end

Given /^I create correct vacancy filter$/ do
  @tests.test_add_filter.set_filter('vacancy_positive')
  @tests.test_add_filter.create_filter
end

Given /^I create incorrect vacancy filter$/ do
  @tests.test_add_filter.set_filter('vacancy_negative')
  @tests.test_add_filter.create_filter
end
