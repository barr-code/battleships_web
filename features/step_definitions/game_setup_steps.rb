Given(/^I am player1$/) do
  visit '/setup'
end

When(/^I follow "(.*?)"$/) do |start|
  click_on(start)
end

Then(/^I see my board$/) do
  pending # express the regexp above with the code you wish you had
end