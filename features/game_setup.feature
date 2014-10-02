Feature: Setting up the Game!
 In order to get this game started
 As a registered player
 I want to start the game

  Scenario: 
   Given "player1" and "player2" exist
   When I follow "Start Game" on the "setup" page
   Then I would see "Player 1 Shoot!" on the "game" page