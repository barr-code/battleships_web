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
  FLEET2.each_with_index do |ship, index| 
    coord = ("A" + (index + 1).to_s).to_sym
    BOARD2.place(ship, coord, :vertically)
  end


  
	get '/' do
    redirect '/setup' if GAME.player1 && GAME.player2
    session[:game] = GAME
 		erb :index
	end

	post '/' do
    if params[:player] == ""
      redirect('/') 
    else  
      GAME.add_player(Player.new(:name => params[:player],:session_id => session[:session_id]))
      @player = params[:player]
      puts GAME.inspect
      erb :index
    end
	end

  get '/setup' do
    GAME.player1.board = BOARD1
    GAME.player2.board = BOARD2
    GAME.player1.session_id == session[:session_id] ? redirect('/game?player=player1') : redirect('/game?player=player2')
    erb :setup
  end

  get '/game' do
    if params[:player] == "player1"
      @name = GAME.player1.name
      @board = GAME.player1.board.grid
      @enemy = "player2"
    else
      @name = GAME.player2.name
      @board = GAME.player2.board.grid
      @enemy = "player1"
    end
    erb :game
  end

  

	run! if app_file == $0
end
