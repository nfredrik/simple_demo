
Given(/^I can access Wikipedia \(2\)$/) do
  @wikipedia = WikipediaPage.new Capybara.current_session
end

When(/^I search for ([^"]*)$/) do |subject|
  @subject = subject
  @wikipedia.search_for @subject
end

Then(/^I get a result for (.*)$/) do |subject|
  @result_page = ResultPage.new subject, Capybara.current_session
  expect(@result_page.is_valid?).to be true
end

And(/^I find interesting information about it$/) do
  case @subject
    when 'Capybara'
      expect(@result_page.has_text? 'is the largest rodent in the world').to be true
    when 'Selenium'
      expect(@result_page.has_text? 'reduce the effects of mercury toxicity').to be true
  end
end