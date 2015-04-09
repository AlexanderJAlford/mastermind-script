require './mastermind'

describe Mastermind do
  
  describe '.new' do
    game = Mastermind.new
    it 'creates an empty gameboard of ten arrays' do
      expect(game.board).to eq [[], [], [], [], [], [], [], [], [], []]
    end
  end
  
  describe '.input' do
    context 'when 4 green pegs are passed to .input' do 
      it 'accepts the input and updates one row of the board accordingly' do
        game = Mastermind.new
        game.input(:green, :green, :green, :green)
        expect(game.board).to eq [[:green, :green, :green, :green], [], [], [], [], [], [], [], [], []]
      end
    end
    it 'accepts input of 4 pegs of all 6 colors' do
      game = Mastermind.new
      game.pegs.each do |color|
        10.times do |i|
          game.input(color, color, color, color)
          expect(game.board[i]).to eq [color, color, color, color]
        end
        game.newgame
      end
    end
  end

  describe '.addpeg' do
    it 'allows additional peg colors to be added' do
      game = Mastermind.new
      game.addpeg(:brown)
      expect(game.pegs).to eq [:pink, :purple, :yellow, :white, :orange, :green, :brown]
    end
  end

    it 'does not allow non-symbol peg colors to be added' do
      game = Mastermind.new
      game.addpeg 'brown'
      expect(game.pegs).not_to eq [:pink, :purple, :yellow, :white, :orange, :green, 'brown']
    end
end
