class Player
  DEFAULT_HP = 100
  attr_reader :name, :HP

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @HP = hp
  end

  def receive_damage(multiplier = 2)
    @HP -= multiplier * random
  end

  def lose
    true if @HP <= 0
  end

  def poisoned?
    @status == :poisoned
  end

  def set_status(status)
    @status = status
  end

  def random
    rand(11)
  end

end
