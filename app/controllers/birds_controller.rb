class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: birds, only: [:id, :name, :species] #use an only to specify when I have an array of hashes/NDS
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird #sometimes you don't want to expose all this data, in this case the database dates, but in others, sensitive user info.
    # render json: { id: bird.id, name: bird.name, species:bird.species } #make a hashh to assign attrs of bird manually to only send that data
    render json: bird.slice(:id, :name, :species) #other option to custom render. slice returns a new hash with only they specified keys NOT GREAT FOR A NDS/multiple hashes
  end
end