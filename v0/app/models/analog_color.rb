class AnalogColor < ApplicationRecord
  has_many :recipes, through: :analog_color_recipes
  has_many :package_recipes, through: :analog_color_recipes
  has_many :packages, through: :package_recipes

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
end
