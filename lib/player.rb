class Player

	attr_accessor :name, :board, :session_id

  def initialize(options = {})
    @name = options[:name]
    @session_id = options[:session_id]
  end

	def has_board?
		!@board.nil?
	end

	def receive_shot(coordinate)
		board.shoot_at(coordinate)
	end
end