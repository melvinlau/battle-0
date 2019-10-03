# require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :turn, :game_in_progress

  def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @players = [@player_1, @player_2]
    @turn = player_2
    @game_in_progress = true
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    @turn = @players.reject {|player| player==turn }[0]
  end

  def victim
    @players.reject {|player| player==turn }[0]
  end

  def gameover_check
    @game_in_progress = false if player_1.lose || player_2.lose
    display_loser
  end

  def display_loser
    if player_1.lose 
      player_1.name
    else
      player_2.name
    end
  end

  def self.create(player_1,player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

end
