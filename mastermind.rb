class Mastermind
  attr_reader :board
  attr_reader :turn
  attr_reader :pegs

  def initialize
    @board = Array.new
    @pegs = ['pink', 'purple', 'yellow', 'white', 'orange', 'green']
  end

  def input(piece1, piece2, piece3, piece4)
    @board.concat([piece1, piece2, piece3, piece4])
  end
end
