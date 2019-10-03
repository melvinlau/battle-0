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
    it 'reduces the player hit points' do
      expect { squirtle.receive_damage }.to change { squirtle.HP }.by(-10)
    end

    it 'reduces to 0HP after being hit 10 times' do
      10.times { squirtle.receive_damage}
      expect(squirtle.HP).to eq 0
    end
  end
end
