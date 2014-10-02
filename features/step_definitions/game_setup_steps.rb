Given(/^"(.*?)" and "(.*?)" exist$/) do |player1, player2|
  visit '/'
  fill_in("player1", with: "Bob")
end

When(/^I follow "(.*?)" on the "(.*?)" page$/) do |link, page|
  click_link("Start Game")
end

Then(/^I would see "(.*?)" on the "(.*?)" page$/) do |title, game_page  |
  expect(page).to have_content("Player 1 Shoot!")
end