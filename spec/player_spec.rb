require 'player'

describe Player do

  subject(:charmander) {described_class.new("charmander")}
  subject(:squirtle) {described_class.new("squirtle")}

  it "returns player's name" do
    expect(charmander.name).to eq "charmander"
  end

  describe '#HP' do
    it 'returns the hit points' do
      expect(squirtle.HP).to eq described_class::DEFAULT_HP
    end
  end

  describe '#receive_damage' do

    before(:each) do
      allow_any_instance_of(Object).to receive(:rand) { 5 }
    end

    it 'reduces the player hit points by a random amount' do
      expect { squirtle.receive_damage }.to change { squirtle.HP }.by(-10)
    end

    it 'reduces to 0HP after being hit 10 times' do
      10.times { squirtle.receive_damage}
      expect(squirtle.HP).to eq 0
    end

    it "reduces by a random amount if poisoned" do
      allow(squirtle).to receive(:poisoned?) { true }
      expect { squirtle.receive_damage(3) }.to change{ squirtle.HP }.by(-3 * rand(11))
    end

  end

  describe "set_status" do
    context 'when poisoned' do
      it 'sets status variable to :poisoned' do
        squirtle.set_status(:poisoned)
        expect(squirtle).to be_poisoned
      end
    end
  end
end
