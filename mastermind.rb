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

  def edit_board(action, *args)
    case action
    when :create
      @board = Array.new(10) {Array.new(4)}
    when :play
      @board[@turncount] = [args[0], args[1], args[2], args[3]]
      @turncount += 1
    when :clear
      self.edit_board(:create)
      @turncount = 0
    end
  end

  def edit_pegs(action, *args)
    case action
    when :remove
      @pegs -= args
    when :add
      @pegs += args
    when :replace
      @pegs[@pegs.index(args[0])] = args[1]
    end
  end
end
