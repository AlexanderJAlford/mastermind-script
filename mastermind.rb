class Mastermind
  def initialize
    edit_board(:create)
    @turncount = 0
    @turn = [:move, :grade]
    @pegs = [:pink, :purple, :yellow, :white, :orange, :green]
  end

  attr_reader(
  :board,
  :turncount,
  :turn,
  :pegs
  )

  def edit_board(action, *pegs)
    case action
    when :create
      @board = Array.new(10) {Array.new(4)}
    when :play
      @board[@turncount] = [pegs[0], pegs[1], pegs[2], pegs[3]]
      @turncount += 1
    when :clear
      self.edit_board(:create)
      @turncount = 0
    end
  end

  def edit_pegs(*pegs) #remember to add case action like edit_board
    pegs.each do |peg|
      if peg.is_a?(Symbol)
        @pegs.push(peg) #inserts new peg at the end of @pegs
      end
    end
  end
end
