require './mastermind'

describe Mastermind do

  describe '#edit_board' do
    let(:empty_board) {Array.new(10) {Array.new(4)}} #Ten arrays of four within an array
    let(:game) { Mastermind.new }
    context '(:create)' do
      it 'creates a 4x10 table as @board' do
        expect(game.edit_board(:create)).to eq empty_board
      end
    end
    context '(:play)' do
      it 'plays args 2-5 as a guess, ignoring args 6+' do
        game.edit_board(:play, :green, :purple, :orange, :yellow, :green, :purple, :green)
        expect(game.board[0]).to eq [:green, :purple, :orange, :yellow]
      end
    end
    context '(:clear)' do
      it 'regenerates @board and resets @turncount' do
        game.edit_board(:play, :green, :purple, :orange, :yellow)
        game.edit_board(:clear)
        expect(game.board).to eq empty_board
        expect(game.turncount).to eq 0
      end
    end
    context '(:set_code)' do
      it 'sets @code to args 2-5, ignoring args 6+' do
        game.edit_board(:set_code, :yellow, :white, :purple, :green)
        expect(game.code).to eq [:yellow, :white, :purple, :green]
      end
    end
  end

  describe '#edit_pegs' do
    let(:default_pegs) { [:pink, :purple, :yellow, :white, :orange, :green] }
    let(:game) { Mastermind.new }
    context '(:remove)' do
      it 'removes pegs that match args 2-* from @pegs' do
        game.edit_pegs(:remove, :pink)
        expect(game.pegs).to eq (default_pegs - [:pink])
      end
    end
    context '(:add)' do
      it 'adds args 2+ to @pegs' do
        game.edit_pegs(:add, :brown, :empty, :blue, :crimson)
        expect(game.pegs).to eq (default_pegs + [:brown, :empty, :blue, :crimson])
      end
    end
    context '(:replace)' do
      it 'replaces pegs in @pegs that match args[0] to equal args[1]' do
        game.edit_pegs(:replace, :purple, :violet)
        expect(game.pegs).not_to include :purple
        expect(game.pegs).to include :violet
      end
    end
  end

  def generate_test_peg_array(length=4)
    if length != Integer
      length = 4
    end
    peg_array = Array.new(length)
    4.times do |i|
      peg_array[i] = game.pegs[rand(6)]
    end
    peg_array
  end

  def generate_test_indices(number=2)
    if number != Integer
      number = 2
    end
    indices = [0, 1, 2, 3]
    indices.sample(number)
  end

  describe '#grade' do
    let(:game) { Mastermind.new }
    context 'when the guess includes pegs that are in @code, but at the wrong index' do
      it 'grades the array with white pegs equal to the number of unique partial-matches' do
        10.times do
          test_code = generate_test_peg_array
          test_guess = generate_test_peg_array
          test_color = game.pegs[rand(6)]
          test_indices = generate_test_indices
          inverse_test_indices = [0, 1, 2, 3].select { |i| i != test_indices[0] && i !=test_indices[1] }

          test_indices.each do |i|
            test_code[i] = test_color
          end

          game.edit_board(:set_code, test_code)
          game.edit_board(:play, test_guess)
          # game.edit_board(:set_code, test_guess)
          # game.edit_board(:play, :white, :yellow, :green, :white)
          # expect(game.grade).to eq [:white, :white]
        end
      end
    end
    # context 'when the guess includes pegs that are in @code and at the correct index' do
    #   it 'grades the array with white pegs equal to the number of unique matches' do
    #   end
    # end
  end
end
