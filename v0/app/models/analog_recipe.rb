class AnalogRecipe < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', inverse_of: :created_analog_recipes, optional: true

  has_many :package_analog_recipes
  has_many :packages, through: :package_analog_recipes

  has_many :analog_color_analog_recipes
  has_many :analog_colors, through: :analog_color_analog_recipes


  def creator
    if self.creator_id.nil?
      return 'Creator unknown'
    end

    super
  end
end
