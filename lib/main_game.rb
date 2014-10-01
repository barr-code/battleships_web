require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'ship'
require_relative 'board'
require_relative 'cell'
require_relative 'water'

class Battleships < Sinatra::Base 
	
  attr_accessor :game, :player1
	GAME = Game.new
  PLAYER1 = Player.new
  PLAYER2 = Player.new
  FLEET1 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
  FLEET2 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
  BOARD1 = Board.new(Cell)
  BOARD2 = Board.new(Cell)
  FLEET1.each_with_index do |ship, index| 
    coord = ("A" + (index + 1).to_s).to_sym
    BOARD1.place(ship, coord, :vertically)
  end

  set :views, Proc.new {File.join(root, '..', 'views')}
  set :public_folder, 'public'
  
	get '/' do
 		erb :index
	end

	post '/' do
    @player1 = params[:player1]
    GAME.add_player(PLAYER1)
    GAME.player1.name = params[:player1]
    PLAYER1.board = BOARD1
    erb :index
	end

  post '/setup' do
    @player2 = params[:player2]
    GAME.add_player(PLAYER2)
    GAME.player2.name = params[:player2]
    PLAYER2.board = BOARD2
    erb :setup
  end

  get '/game/player1' do
    @board = PLAYER1.board.grid
    erb :game
  end

	run! if app_file == $0
end
