require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/adoptions.rb')
require_relative('../models/animals.rb')
require_relative('../models/owner.rb')
require_relative('../models/status.rb')

get '/rehome' do
  @animals = Animal.all()
  erb( :"rehome/index" )
end

get'/rehome/:id' do
  @animal = Animal.find( params[:id] )
  erb( :"rehome/show")
end
