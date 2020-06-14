class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only: [:id, :name, :species]
    elsif !params[:id].to_i
      render json: { message: "Please use numerical ids on this route"}
    else
      render json: { message: "Bird not found" }
    end

    private

    def bird_params
      params.require(:birds).permit(:name, :species)
    end
  end
end