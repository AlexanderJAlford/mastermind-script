class Mastermind
  def initialize
    edit_board(:create)
    @turncount = 0
    @turn = [:move, :grade]
    @pegs = [:pink, :purple, :yellow, :white, :orange, :green]
    @code = Array.new(4)
  end

  attr_reader(
  :board,
  :turncount,
  :turn,
  :pegs,
  :code
  )

  def edit_board(action, *args)
    case action
    when :create
      @board = Array.new(10) {Array.new(4)}
    when :play
      @board[@turncount] = [args[0], args[1], args[2], args[3]]
    when :clear
      self.edit_board(:create)
      @turncount = 0
    when :set_code
      @code = [args[0], args[1], args[2], args[3]]
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

  def grade
    grade = Array.new(4)
    guess = board[@turncount]
    @turncount += 1
    white_peg_matches = @code.select.with_index { |peg, index| guess.include?(peg) && guess[index] != @code[index] }
    # If one wishes to read the color of the pegs, this is the place to do it.
    white_peg_matches.map! { |peg| :white }
    # red_peg_matches = @code.select.with_index { |peg, index| guess[index] == peg }
    # red_peg_matche
    return white_peg_matches.shuffle
  end
end
