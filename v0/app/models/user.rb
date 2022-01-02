class User < ApplicationRecord
  has_secure_password

  has_many :packages, through: :user_package_purchases
  has_many :created_packages, class_name: 'Package', inverse_of: 'creator'
  has_many :package_recipes, through: :packages
  has_many :recipes, through: :package_recipes
  has_many :created_recipes, class_name: 'Recipe', inverse_of: 'creator'
  has_many :analog_color_recipes, through: :recipes
  has_many :analog_colors, through: :analog_color_recipes
  has_many :created_analog_colors, class_name: 'AnalogColor', inverse_of: 'creator'
end
