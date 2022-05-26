class DigitalColorsController < ApplicationController
  before_action :set_digital_color, only: %i[ show update destroy ]

  # GET /digital_colors
  def index
    @digital_colors = DigitalColor.all

    render json: @digital_colors
  end

  # GET /digital_colors/1
  def show
    render json: @digital_color
  end

  # POST /digital_colors
  def create
    @digital_color = DigitalColor.new(digital_color_params)

    if @digital_color.save
      render json: @digital_color, status: :created, location: @digital_color
    else
      render json: @digital_color.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /digital_colors/1
  def update
    if @digital_color.update(digital_color_params)
      render json: @digital_color
    else
      render json: @digital_color.errors, status: :unprocessable_entity
    end
  end

  # DELETE /digital_colors/1
  def destroy
    @digital_color.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_digital_color
      @digital_color = DigitalColor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def digital_color_params
      params.require(:digital_color).permit(:name, :UID)
    end
end
