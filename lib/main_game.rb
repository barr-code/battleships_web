require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'ship'
require_relative 'board'
require_relative 'cell'
require_relative 'water'

class Battleships < Sinatra::Base 

  set :views, Proc.new {File.join(root, '..', 'views')}
  set :public_folder, 'public'
  enable :sessions

  GAME = Game.new
  FLEET1 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
  FLEET2 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
  BOARD1 = Board.new(Cell)
  BOARD2 = Board.new(Cell)
  FLEET1.each_with_index do |ship, index| 
    coord = ("A" + (index + 1).to_s).to_sym
    BOARD1.place(ship, coord, :vertically)
  end


  
	get '/' do
    session[:game] = GAME
 		erb :index
	end

	post '/' do
    @player1 = params[:player1]
    GAME.add_player(Player.new(params[:player1]))
    puts GAME.inspect
    erb :index
	end

  post '/setup' do
    erb :setup
  end

  get '/game/player1' do
    puts GAME.inspect
    puts session.inspect
    @board = PLAYER1.board.grid
    erb :game
  end

	run! if app_file == $0
end
