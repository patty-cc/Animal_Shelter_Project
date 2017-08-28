require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/adoptions.rb')
require_relative('../models/animals.rb')
require_relative('../models/owner.rb')
require_relative('../models/status.rb')

#index page for the animals
get '/rehome' do
  @animals = Animal.all()
  erb( :"rehome/index" )
end

#form to create a new animal
get '/rehome/new' do
  @status = Status.all()
  erb( :"rehome/new")
end

#page for displaying individual animals
get '/rehome/:id' do
  @animal = Animal.find( params[:id] )
  erb( :"rehome/show")
end

#create a new pet
post '/rehome' do
  @animal = Animal.new( params )
  @animal.save()
  @status = Status.new( params )
  @status.save()
  redirect to ('/rehome')
end

# delete pet from database
post '/rehome/:id/delete' do
  @animal = Animal.find( params[:id] )
  @animal.delete()
  redirect to('/rehome')
end
