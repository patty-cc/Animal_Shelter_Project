require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/adoptions.rb')
require_relative('../models/animals.rb')
require_relative('../models/owner.rb')
require_relative('../models/status.rb')

#index page for the owners
get '/owner' do
  @owners = Owner.all()
  erb( :"adoptee/index" )
end

#create a new owner
get '/owner/new' do
  @owners = Owner.all()
  erb( :"adoptee/new")
end

post '/owner' do
  @owner = Owner.new( params )
  @owner.save()
  redirect to ('/owner')
end
