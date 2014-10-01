require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class Battleships < Sinatra::Base 
	
  attr_accessor :game, :player1
	GAME = Game.new
  PLAYER1 = Player.new
  PLAYER2 = Player.new


  set :views, Proc.new {File.join(root, '..', 'views')}
  set :public_folder, 'public'
  
	get '/' do
 		erb :index
	end

	post '/' do
    @player1 = params[:player1]
    GAME.add_player(PLAYER1)
    GAME.player1.name = params[:player1]
    erb :index
	end

  post '/setup' do
    @player2 = params[:player2]
    GAME.add_player(PLAYER2)
    GAME.player2.name = params[:player2]    
    erb :setup
  end

  get '/setup' do
    puts GAME.inspect
  end

	run! if app_file == $0
end
