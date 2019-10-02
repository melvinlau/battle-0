require 'Player'

describe Player do

  subject(:player) {described_class.new("Charmander")}

  it 'returns its name' do
    expect(player.name).to eq "Charmander"
  end

end
