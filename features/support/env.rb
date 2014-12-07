require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium/webdriver'
require_relative '../pages/wikipedia_page'
require_relative '../pages/result_page'

Capybara.default_driver = :selenium

