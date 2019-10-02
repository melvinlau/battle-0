class Player
  DEFAULT_HP = 100
  attr_reader :name, :HP

  def initialize(name)
    @name = name
    @HP = DEFAULT_HP
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @HP -= 10
  end

end
