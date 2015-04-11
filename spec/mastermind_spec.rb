require './mastermind'

describe Mastermind do
  
  # describe '.new' do
  #   let(:board) {Mastermind.new.board_gen}
  #   it 'creates an empty gameboard of ten arrays' do
  #     expect(board).to eq [[], [], [], [], [], [], [], [], [], []]
  #   end
  # end
  
  # describe '.input' do

  #   context 'when 4 green pegs are passed to .input' do

  #     it 'accepts the input and updates one row of the board accordingly' do
  #       game = Mastermind.new
  #       game.input(:green, :green, :green, :green)
  #       expect(game.board).to eq [[:green, :green, :green, :green], [], [], [], [], [], [], [], [], []]
  #     end
  #   end

  #   it 'accepts input of 4 pegs of all 6 colors' do
  #     game = Mastermind.new
  #     game.pegs.each do |color|
  #       10.times do |i|
  #         game.input(color, color, color, color)
  #         expect(game.board[i]).to eq [color, color, color, color]
  #       end
  #       game.newgame
  #     end
  #   end
  # end

  # describe '.board_gen' do
  #   subject{ Mastermind.new.board_gen }
  #   it { is_expected.to eq [[], [], [], [], [], [], [], [], [], []] }
  # end

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
end
