Feature: Game Setup
	In order to have a friendly game of Battleships
	As a player
	I want to join a new game

Scenario: Naming Player 1
	Given I am on the homepage
	When I submit "Victoria" in "player1"
	And click on "Submit"
	Then I see "Victoria" on the page