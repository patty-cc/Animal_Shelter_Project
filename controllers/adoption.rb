require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/adoptions.rb')
require_relative('../models/animals.rb')
require_relative('../models/owner.rb')
require_relative('../models/status.rb')

get '/adoptions' do
  @adoptions = Adoption.all()
  erb( :"adoption/index" )
end

get '/adoptions/new' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb( :"adoption/new" )
end

post '/adoptions' do
  @adoptions = Adoption.new( params )
  @adoptions.save()
  redirect to ('adoptions')
end
