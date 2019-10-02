# to run with "rackup ____filename_____"
require 'sinatra/base'
#  to run with "shotgun ___config.ru___ -p 4567"
require 'sinatra'
set :session_secret, 'super secret'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    redirect("/play")
  end

  get '/play' do
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    erb(:play)
  end

  get '/attack' do
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    erb(:attack)
  end

  # start the server only if the ruby file is executed directly
  run! if app_file == $0
end