class User < ApplicationRecord
  has_secure_password

  has_many :user_package_purchases
  has_many :packages, through: :user_package_purchases

  has_many :created_packages, class_name: 'Package', inverse_of: 'creator', foreign_key: 'creator_id'
  has_many :created_analog_recipes, class_name: 'AnalogRecipe', inverse_of: 'creator', foreign_key: 'creator_id'
  has_many :created_analog_colors, class_name: 'AnalogColor', inverse_of: 'creator', foreign_key: 'creator_id'

  validates :username, presence: true, length: {minimum: 5, maximum: 50}
  validates :password, presence: true, length: {minimum: 5}
end
