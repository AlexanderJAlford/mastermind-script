class Mastermind
  attr_reader(
    :board,
    :turncount,
    :turn,
    :pegs
    )

  def initialize
    @board = Array.new(10, Array.new)
    @turncount = 0
    @turn = [:move, :grade]
    @pegs = [:pink, :purple, :yellow, :white, :orange, :green]
  end

  def addpeg(*new_peg)
    new_peg.each do |peg|
      if peg.is_a?(Symbol)
        @pegs.push(peg) #inserts new peg at the end of @pegs
      end
    end
  end

  def input(peg1, peg2, peg3, peg4)
    @board[@turncount] = [peg1, peg2, peg3, peg4]
    @turncount += 1
  end

  def newgame
    @board = Array.new(10, Array.new)
    @turncount = 0
    @turn = [:move, :grade]
    @pegs = [:pink, :purple, :yellow, :white, :orange, :green]
  end
end
