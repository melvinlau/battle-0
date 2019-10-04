# to run with "rackup ____filename_____"
require 'sinatra/base'
#  to run with "shotgun ___config.ru___ -p 4567"
require 'sinatra'
set :session_secret, 'super secret'

require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  before do
    @game = Game.instance
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1,player_2)
    redirect("/play")
  end

  
  get '/play' do
    @game.gameover_check
    @game.switch_turn
    @game.status_check
    erb(:play)
  end
  
  get '/attack' do
    @game.attack(@game.victim)
    erb(:attack)
  end
  
  get '/poison' do
    @game.poison(@game.victim)
    erb(:poison)
  end
  
  get '/single_player' do
    erb :single_player
  end

  post '/single_setup' do
    player = Player.new(params[:player])
    computer = Player.new("Compy")
    @game = Game.create(player, computer)
    redirect '/play'
  end

  # get '/computer_turn' do

  #   erb :attack
  # end

  # start the server only if the ruby file is executed directly
  run! if app_file == $0
end
