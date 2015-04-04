class Mastermind
  attr_reader(
    :board,
    :turncount,
    :turn,
    :pegs
    )

  def initialize
    @board = Array.new
    @turncount = 0
    @turn = [:move, :grade]
    @pegs = [:pink, :purple, :yellow, :white, :orange, :green]
  end

  def addpeg(*new_peg)
    new_peg.each do |peg|
      if peg.is_a?(Symbol)
        @pegs += peg
      end
    end
  end

  def input(piece1, piece2, piece3, piece4)
    @board.concat([piece1, piece2, piece3, piece4])
  end
end
