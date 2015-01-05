# Steps for Scenario: Searching for one specific subject using python

from selenium import webdriver

@Given("^I can access Wikipedia$")
def access_wikipedia():

  #visit 'http://en.wikipedia.org/wiki/Main_Page'
  ssc.wd = webdriver.Chrome()  
  ssc.wd.get('http://en.wikipedia.org/wiki/Main_Page')
 

# Regexp matching subject within quotes
@When("^I search for '(.*)'$") #do |subject|
def II_search_for_subject(subject):

  #fill_in('searchInput', :with => subject)
  #click_on('searchButton')
  pass

# Regexp matching subject with or without quotes
@Then("^I get a result for ?([^']*)?$") # do |subject|
def II_get_a_result_for(subject):
  #expect(find('h1').text).to eq(subject)
  pass

###################################################

# Steps for   Scenario Outline: Searching for several subjects

# Reuse: Given I can access Wikipedia

# Regexp matching subject without quotes
# Use search function defined elsewhere
@When("I search for ([^']*)$") #do |subject|
def search_for(subject):

  #search_for subject
  pass


# Reuse: Then I get a result for <subject>

# Use validation function defined elsewhere
@And("^I find relevant information on (.*)$") #do |subject|
def find_relevant_information(subject):
  #validate_relevance_for subject
  pass

####################################################

# Steps for Scenario Outline: Searching without repeating subject

# Reuse: Given I can access Wikipedia

# Save subject for later use
@When("^I search for the subject '(.*)'$") #do |subject|
def _search_for_the_subject(subject):
  #search_for subject
  #@subject = subject
  pass

# Use the saved subject
@Then("^I get a matching result$") # do
def get_a_matching_result():  
  #expect(find('h1').text).to eq(@subject)
  pass

# Use the saved subject
@And("^I find relevant information$") #do
def find_rel_info():
  #validate_relevance_for @subject
  pass

####################################################

# Submit a search for a subject.
# Hide the daunting complexity of the search form.
def search_for(subject):
  #fill_in('searchInput', :with => subject)
  #click_on('searchButton')
  pass

def validate_relevance_for(subject):
  #case subject
  #  when 'Capybara'
  #    expect(page.has_text? 'is the largest rodent in the world').to be true
  #  when 'Selenium'
  #    expect(find_by_id('mw-content-text').has_text? 'reduce the effects of mercury toxicity').to be true
  #  else
  #    pending 'This subject has no expected text'
  pass
