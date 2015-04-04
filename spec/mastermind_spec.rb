require './mastermind'

RSpec.describe Mastermind do
  context "while initializing"
    it "creates an empty gameboard" do
      game = Mastermind.new

      expect(game.board).to be_empty
    end
  context "input"
    it "accepts input of 4 green pegs" do
      game = Mastermind.new
      game.input(:green, :green, :green, :green)
      expect(game.board).to eq [:green, :green, :green, :green]
    end

      it "accepts input of 4 pegs of all 6 colors" do
        game = Mastermind.new
        game.pegs.each do |color|
          game.input(color, color, color, color)
          expect(game.board).to eq [color, color, color, color]
          game.board.clear
        end
      end

      it "allows additional peg colors to be added" do
        game = Mastermind.new
        game.addpeg :brown
        expect(game.pegs).to eq [:pink, :purple,
          :yellow, :white, :orange, :green, :brown]
      end

      it "does not allow non-symbol peg colors to be added" do
        game = Mastermind.new
        game.addpeg 'brown'
        expect(game.pegs).not_to eq [:pink, :purple,
          :yellow, :white, :orange, :green, 'brown']
    end
end
