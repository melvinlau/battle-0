require 'game'

describe Game do
  subject(:game) { described_class.new(player_1,player_2) }
  let(:player_1) { double :player, name: "Charmander" }
  let(:player_2) { double :player, name: "Squirtle" }

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#attack' do
    it 'damages the other player' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end

    it 'damages the opponent 10 times when attack is played 19 times' do
      allow(player_1).to receive(:receive_damage)
      allow(player_2).to receive(:receive_damage)
      expect(player_2).to receive(:receive_damage).exactly(10).times
      19.times do
        game.switch_turn
        game.attack(game.victim)
      end
    end
  end

  describe '#poison' do

    before(:each) { allow_any_instance_of(Object).to receive(:rand) { 2 } }

    it 'calls poison against the victim' do
      expect(player_2).to receive(:set_status).with(:poisoned)
      game.poison(player_2)
    end

  end

  describe "#status_check" do
    context "when player is poisoned" do
      it "reduces the damage in the player" do
        expect(player_2).to receive(:receive_damage).with(1)
        allow(player_2).to receive(:poisoned?) { true }
        game.status_check
      end
    end
  end

  describe '#switch_turn' do
    it "shows the player who's next" do
      expect(game.switch_turn).to eq player_1
    end
  end

end
