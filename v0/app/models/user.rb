class User < ApplicationRecord
  has_secure_password

  has_many :user_package_purchases
  has_many :packages, through: :user_package_purchases

  has_many :created_packages, class_name: 'Package', inverse_of: 'creator'
  has_many :created_analog_recipes, class_name: 'AnalogRecipe', inverse_of: 'creator'
  has_many :created_analog_colors, class_name: 'AnalogColor', inverse_of: 'creator'
end
