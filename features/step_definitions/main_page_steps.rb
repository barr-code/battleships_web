Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I submit "(.*?)" in "(.*?)"$/) do |name, player1|
  fill_in(player1, with: name)
end

When(/^click on "(.*?)"$/) do |submit|
  click_on(submit)
end

Then(/^I see "(.*?)" on the page$/) do |name|
  expect(page).to have_content(name)
end