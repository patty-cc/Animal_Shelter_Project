require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/rehome.rb')

get '/' do
  erb( :index )
end
