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

  post '/owners' do
  @owner = Owner.create(params[:owner])
  if !params["pet"]["name"].empty? #need this condition to avoid creating pet with empty name if user leaves box blank
    @owner.pets << Pet.create(name: params["pet"]["name"])
  end
  redirect "owners/#{@owner.id}"
end

end
