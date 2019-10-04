class Player
  DEFAULT_HP = 100
  attr_reader :name, :HP

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @HP = hp
  end

  def receive_damage
    @HP -= 2 * random
  end

  def lose
    true if @HP <= 0
  end

  def random
    rand(11)
  end

end
