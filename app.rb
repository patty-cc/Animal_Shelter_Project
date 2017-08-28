require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/rehome.rb')
require_relative( 'controllers/adoptee.rb')


get '/' do
  erb( :index )
end
