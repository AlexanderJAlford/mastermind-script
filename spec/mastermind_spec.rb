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
      it 'plays args 2-5 as a guess' do
        game.edit_board(:play, :green, :purple, :orange, :yellow)
        expect(game.board[0]).to eq [:green, :purple, :orange, :yellow]
      end
      it 'ignores args 6 and above' do
        game.edit_board(:play, :purple, :yellow, :pink, :white, :green, :purple, :green)
        expect(game.board[0]).to eq [:purple, :yellow, :pink, :white]
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
  end
  describe '.edit_pegs' do
    let(:game) { Mastermind.new }
    it 'allows additional peg colors to be added' do
      game.edit_pegs :brown
      expect(game.pegs).to eq [:pink, :purple, :yellow, :white, :orange, :green, :brown]
    end

    it 'does not allow non-symbol peg colors to be added' do
      game.edit_pegs 'brown'
      expect(game.pegs).not_to eq [:pink, :purple, :yellow, :white, :orange, :green, 'brown']
    end
  end
  describe '.new_game' do
    subject { Mastermind.new }

end
