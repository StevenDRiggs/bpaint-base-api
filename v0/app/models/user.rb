class User < ApplicationRecord
  has_secure_password

  has_many :user_package_purchases
  has_many :packages, through: :user_package_purchases

  has_many :created_packages, class_name: 'Package', inverse_of: 'creator', foreign_key: 'creator_id'
  has_many :created_analog_recipes, class_name: 'AnalogRecipe', inverse_of: 'creator', foreign_key: 'creator_id'
  has_many :created_analog_colors, class_name: 'AnalogColor', inverse_of: 'creator', foreign_key: 'creator_id'

  validates :username, presence: true, length: {minimum: 5, maximum: 50}
  validates :password, presence: true, length: {minimum: 5}
  validates :email, presence: true, email: true


  def self.find_by_username_or_email(username_or_email)
    user = self.find_by(username: username_or_email)
    unless user
      user = self.find_by(email: username_or_email)
    end

    user
  end


  def as_json(options)
    options[:except] ||= [:password_digest]

    super(options)
  end
end
