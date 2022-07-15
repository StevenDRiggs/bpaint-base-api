class AnalogColorsController < ApplicationController
  before_action :set_analog_color, only: %i[ show update destroy ]

  # GET /analog_colors
  def index
    @analog_colors = AnalogColor.all

    render json: @analog_colors
  end

  # GET /analog_colors/1
  def show
    render json: @analog_color
  end

  # POST /analog_colors
  def create
    @analog_color = AnalogColor.new(analog_color_params)

    if @analog_color.save
      render json: @analog_color, status: :created, location: @analog_color
    else
      render json: @analog_color.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /analog_colors/1
  def update
    if @analog_color.update(analog_color_params)
      render json: @analog_color
    else
      render json: @analog_color.errors, status: :unprocessable_entity
    end
  end

  # DELETE /analog_colors/1
  def destroy
    @analog_color.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analog_color
      @analog_color = AnalogColor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def analog_color_params
      params.require(:analog_color).permit(:image, :name, :body, :brandname, :glossiness, :lightfastness, :medium, :opaqueness, :series, :thickness, :tinting, :creator_id)
    end
end
