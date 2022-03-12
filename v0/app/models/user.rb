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


  def create_package(name)
    self.created_packages.create(name: name)
  end

  def create_recipe
    self.created_analog_recipes.create
  end

  def create_color(**args)
    new_color_hashmap = {
      brandname: args[:brandname],
      medium: args[:medium],
      name: args[:name],
      series: args[:series] || 'undefined',
    }
    if args[:image_file] != nil
      # TODO: image storage methods
    else
      new_color_hashmap[:image_url] = args[:image_url]
    end
    for arg in %i[body glossiness lightfastness opaqueness thickness tinting]
      if args[arg] != nil
        new_color_hashmap[arg] = args[arg]
      end
    end

    new_color = self.created_analog_colors.create(**new_color_hashmap)
    new_recipe = self.create_recipe
    new_recipe.analog_colors.add(new_color)
    quantity_adjustor = new_recipe.analogcolor_analog_recipes.last
    quantity_adjustor.quantity = 1
    quantity_adjustor.save

    new_color
  end

  def creations
    {
      packages: self.created_packages.all,
      recipes: self.created_analog_recipes.all,
      analog_colors: self.created_analog_colors.all,
    }
  end

  def as_json(options = {})
    options[:except] ||= [:password_digest]
    options[:methods] ||= [:creations]

    super(options)
  end
end
