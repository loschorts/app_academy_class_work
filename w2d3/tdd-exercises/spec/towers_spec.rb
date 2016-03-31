require 'byebug'
require 'rspec'
require_relative '../lib/towers.rb'

describe Game do
  subject(:new_game) {Game.new}
  context "Game#Initialize" do
    let(:expected_towers) {[
      [3,2,1],
      [],
      []
      ]}
    it 'initializes a game with three towers' do
      expect(new_game).to have_attributes(:towers => expected_towers)
    end
  end
  context "Game#play" do
    let(:game) {Game.new}
    after(:each) do
      game.play
    end
    it 'uses gets.chomp' do
      expect(game).to receive(:gets)
    end
    it 'render the board' do
      expect(game).to receive(:render)
    end
    it 'checks if the game is over' do
      expect(game).to receive(:game_over?)
    end
    it "validates the player's move" do
      expect(game).to receive(:valid?)
    end
    context "it validates and executes a move" do
      let(:kernel) {double("kernel")}
      it 'if the move is valid' do
        allow(kernel).to receive(:gets).and_return([0,2])
        allow(game).to receive(:valid?).and_return(true)
        allow(game).to receive(:game_over?).and_return(false)
        expect(game).to receive(:move_disc)
      end

      it 'expect move_disc to receive the move as a parameter'
      it 'expect move_disc to be called only if the move is valid'

    end

  end

end
