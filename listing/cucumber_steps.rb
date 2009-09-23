When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end