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

Given(/^"(.*?)" has been created$/) do |player1|
  visit '/'
  fill_in(player1, with: "Victoria")
  click_on('Submit')
end

Then(/^I go to a new "(.*?)" and see "(.*?)"$/) do |route, pagetitle|
  expect(page).to have_content('Start Game')
end

Given(/^some twit forgets to add their name in "(.*?)"$/) do |player|
  visit '/'
end

When(/^they press "(.*?)"$/) do |action|
  click_on('Submit')
end

Then(/^I go back to the same page and see "(.*?)"$/) do |prompt|
  expect(page).to have_content('try again')
end