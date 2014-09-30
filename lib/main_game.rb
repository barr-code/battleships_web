require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class Battleships < Sinatra::Base 
	attr_accessor :game, :player1

	@game = Game.new
	@player1 = Player.new

  	set :views, Proc.new {File.join(root, '..', 'views')}
  
  	get '/' do
   		erb :index
  	end

  	get '/:player1' do 
  	   @name = params[:player1]
  	end

  # start the server if ruby file executed directly
  	run! if app_file == $0
end
