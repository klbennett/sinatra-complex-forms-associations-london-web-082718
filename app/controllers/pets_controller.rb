class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end


  # That checkbox has a name of "owner[pet_ids][]" because we want to structure our params hash such that the array of pet IDs is stored inside the "owner" hash. We are aiming to associate the pets that have these IDs with the new owner.
  # We give the checkbox a value of the given pet's ID. This way, when that checkbox is selected, its value, i.e., the pet's ID, is what gets sent through to the params hash.
  post '/owners' do
  @owner = Owner.create(params[:owner])
  if !params["pet"]["name"].empty? #need this condition to avoid creating pet with empty name if user leaves box blank
    @owner.pets << Pet.create(name: params["pet"]["name"])
  end
  redirect "owners/#{@owner.id}"
end

end
