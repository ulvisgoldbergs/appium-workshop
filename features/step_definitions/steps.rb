Given /^I am on intro screen$/ do
  @tests.test_intro.intro_visible?
end

Given /^I have opened create filter screen$/ do
  @tests.test_intro.close_intro
end

Given /^I create correct (.*?) filter$/ do |type|
  filter_dict = {'landline' => 'property_positive'}
  filter_dict['transport'] = 'transport_positive'
  filter_dict['vacancy'] = 'vacancy_positive'
  @tests.test_add_filter.set_filter(filter_dict[type])
  @tests.test_add_filter.create_filter
end

Given /^I create incorrect (.*?) filter$/ do |type|
  filter_dict = {'landline' => 'property_negative'}
  filter_dict['transport'] = 'transport_negative'
  filter_dict['vacancy'] = 'vacancy_negative'
  @tests.test_add_filter.set_filter(filter_dict[type])
  @tests.test_add_filter.create_filter
end

Then /^I check if I am on filter parameter screen$/ do
  @tests.test_filter_existance.check_screen
end

Given /^I validate created filter$/ do
  @tests.test_filter_existance.check_filter_existance
end
