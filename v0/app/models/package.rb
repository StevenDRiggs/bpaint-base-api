class Package < ApplicationRecord
  has_many :user_package_purchases
  has_many :purchasing_users, class_name: 'User', through: :user_package_purchases

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', inverse_of: :created_packages, optional: true

  has_many :package_analog_recipes
  has_many :analog_recipes, through: :package_analog_recipes
  has_many :analog_color_analog_recipes, through: :analog_recipes
  has_many :analog_colors, through: :analog_color_analog_recipes

  def creator
    if self.creator_id.nil?
      return 'Creator unknown'
    end

    super
  end
end
