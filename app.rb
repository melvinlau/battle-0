# to run with "rackup"
require 'sinatra/base'
#  to run with "shotgun ___ -p 4567"
require 'sinatra'
set :session_secret, 'super secret'

class Battle < Sinatra::Base
  get '/' do
    "Hello Battle!"
    'Testing infrastructure working!'
  end

  # start the server only if the ruby file is executed directly
  run! if app_file == $0
end