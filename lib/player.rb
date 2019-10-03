class Player
  DEFAULT_HP = 100
  attr_reader :name, :HP

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @HP = hp
  end

  def receive_damage
    @HP -= 10
  end

  def lose
    true if @HP <= 0
  end

end
