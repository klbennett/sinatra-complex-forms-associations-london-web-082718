class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

#use erb to get all of the pets with Pet.all
#iterate over collection of objects and generate checkbox for each pets
# checkbox has a name of "owner[pet_ids][]" because we want to structure our params hash such that the array of pet IDs is stored inside the "owner" hash

  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do

  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  patch '/owners/:id' do

  end
end
