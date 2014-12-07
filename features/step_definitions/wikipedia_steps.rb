# Steps for Scenario: Searching for one specific subject

Given(/^I can access Wikipedia$/) do
  visit 'http://en.wikipedia.org/wiki/Main_Page'
end

# Regexp matching subject within quotes
When(/^I search for "(.*)"$/) do |subject|
  fill_in('searchInput', :with => subject)
  click_on('searchButton')
end

# Regexp matching subject with or without quotes
Then(/^I get a result for "?([^"]*)"?$/) do |subject|
  expect(find('h1').text).to eq(subject)
end

###################################################

# Steps for   Scenario Outline: Searching for several subjects

# Reuse: Given I can access Wikipedia

# Regexp matching subject without quotes
# Use search function defined elsewhere
When(/^I search for ([^"]*)$/) do |subject|
  search_for subject
end

# Reuse: Then I get a result for <subject>

# Use validation function defined elsewhere
And(/^I find relevant information on (.*)$/) do |subject|
  validate_relevance_for subject
end

####################################################

# Steps for Scenario Outline: Searching without repeating subject

# Reuse: Given I can access Wikipedia

# Save subject for later use
When(/^I search for the subject "(.*)"$/) do |subject|
  search_for subject
  @subject = subject
end

# Use the saved subject
Then(/^I get a matching result$/) do
  expect(find('h1').text).to eq(@subject)
end

# Use the saved subject
And(/^I find relevant information$/) do
  validate_relevance_for @subject
end

####################################################

# Submit a search for a subject.
# Hide the daunting complexity of the search form.
def search_for(subject)
  fill_in('searchInput', :with => subject)
  click_on('searchButton')
end

def validate_relevance_for(subject)
  case subject
    when 'Capybara'
      expect(page.has_text? 'is the largest rodent in the world').to be true
    when 'Selenium'
      expect(find_by_id('mw-content-text').has_text? 'reduce the effects of mercury toxicity').to be true
    else
      pending 'This subject has no expected text'
  end
end

