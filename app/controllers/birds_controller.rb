class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
   if bird = Bird.find_by(id: params[:id])
    # renders only the bird's id, name, and species
  #   render json: {id: bird.id, name: bird.name,
  # species: bird.species}

  # slice can also be used
  render json: bird.slice(:id, :name, :species)
  # handles errors
  else 
    render json: {message: 'Bird not found'}
  end
end
end