class Mastermind
  attr_reader :board
  attr_reader :turn

  def initialize
    @board = Array.new
  end

  def input(piece1, piece2, piece3, piece4)
    @board.concat([piece1, piece2, piece3, piece4])
  end
end
