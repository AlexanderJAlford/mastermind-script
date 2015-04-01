require_relative '../mastermind'

RSpec.describe Mastermind do
  context "while initializing"
    it "creates an empty gameboard" do
      game = Mastermind.new
      expect(game.board).to be_empty
    end
  context "after initializing"
  it "accepts input of green pins" do
    game = Mastermind.new
    game.input('green', 'green', 'green', 'green')
    expect(game.board).to eq ['green', 'green', 'green', 'green']
  end
end