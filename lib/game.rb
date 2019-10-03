# require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @players = [@player_1.name, @player_2.name]
    @turn = player_1.name
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    @turn = @players.reject {|player| player==turn }[0]
  end
end