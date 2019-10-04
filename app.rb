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

  # start the server only if the ruby file is executed directly
  run! if app_file == $0
end
