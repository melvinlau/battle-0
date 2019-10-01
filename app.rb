# to run with "rackup"
require 'sinatra/base'
#  to run with "shotgun ___ -p 4567"
require 'sinatra'
set :session_secret, 'super secret'

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    @player_1_name = params[:player_1_name]
    @player_2_name = params[:player_2_name]
    erb(:play)
  end

  # start the server only if the ruby file is executed directly
  run! if app_file == $0
end