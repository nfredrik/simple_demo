Given(/^I can access Wikipedia$/) do
  visit 'http://en.wikipedia.org/wiki/Main_Page'
end

When(/^I search for "([^"]*)"$/) do |subject|
  fill_in('searchInput', :with => subject)
  click_on('searchButton')
end

Then(/^I find interesting information on this subject$/) do
  expect(page).to have_content('is the largest rodent in the world')
end
