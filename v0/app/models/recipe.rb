class Recipe < ApplicationRecord
  has_many :packages, through: :package_recipes
  has_many :analog_colors, through: :analog_color_recipes

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
end
