class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]

  # GET /plants
  # GET /plants.json
  def index
    @plants = Plant.all

    render json: @plants
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
    render json: @plant
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = Plant.new(plant_params)

    if @plant.save
      render json: @plant, status: :created, location: @plant
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plants/1
  # PATCH/PUT /plants/1.json
  def update
    @plant = Plant.find(params[:id])

    if @plant.update(plant_params)
      head :no_content
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant.destroy

    head :no_content
  end

  private

    def set_plant
      @plant = Plant.find(params[:id])
    end

    def plant_params
      params.require(:plant).permit(:name, :scientific_name, :description, :picture, :picture_cache, :picture_url)
    end
end
