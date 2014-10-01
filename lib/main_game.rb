require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class Battleships < Sinatra::Base 
	
  attr_accessor :game, :player1
	@game = Game.new
  @player = Player.new

  set :views, Proc.new {File.join(root, '..', 'views')}
  set :public_folder, 'public'
  
	get '/' do
 		erb :index
	end

	post '/' do
    @player1 = params[:player1]
    erb :index
	end

	run! if app_file == $0
end
