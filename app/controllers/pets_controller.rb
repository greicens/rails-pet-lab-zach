class PetsController < ApplicationController

  def index
    owner_id = params[:owner_id]
    @owner = Owner.find_by(id: owner_id)
    @pets = @owner.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end


  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.create(pet_params)
    redirect_to owner_pets_path(@pet)
  end

  # TODO: set up *new* method with data for new view

  # TODO: set up *create* method with database interactions for create
  # TODO: handle save errors and communicate issues to user

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
