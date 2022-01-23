class AnalogRecipesController < ApplicationController
  before_action :set_analog_recipe, only: %i[ show update destroy ]

  # GET /analog_recipes
  def index
    @analog_recipes = AnalogRecipe.all

    render json: @analog_recipes
  end

  # GET /analog_recipes/1
  def show
    render json: @analog_recipe
  end

  # POST /analog_recipes
  def create
    @analog_recipe = AnalogRecipe.new(analog_recipe_params)

    if @analog_recipe.save
      render json: @analog_recipe, status: :created, location: @analog_recipe
    else
      render json: @analog_recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /analog_recipes/1
  def update
    if @analog_recipe.update(analog_recipe_params)
      render json: @analog_recipe
    else
      render json: @analog_recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /analog_recipes/1
  def destroy
    @analog_recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analog_recipe
      @analog_recipe = AnalogRecipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def analog_recipe_params
      params.require(:analog_recipe).permit(:creator_id)
    end
end
