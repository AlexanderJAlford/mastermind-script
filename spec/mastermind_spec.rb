require './mastermind'

describe Mastermind do

  describe '.edit_board' do
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

  describe '.edit_pegs' do
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

  describe '.grade' do
    let(:game) { Mastermind.new }
    context 'when passed an array equal to @code' do
      it 'grades the array with four red pegs' do
        game.edit_board(:set_code, :yellow, :green, :green, :purple)
        game.edit_board(:play, :green, :yellow, :green, :purple)
        expect(game.grade).to eq [:red, :red, :red, :red]
      end
    end
  end
end
