class AnalogRecipe < ApplicationRecord
  has_one_attached :recipe_image

  validates :name, presence: true
  validates :image_url, presence: true
  validates :specifics, presence: true, a_r_specifics: true

  def self.create(*args)
    if !(
        args[:specifics].length >= 2 &&
        args[:specifics].all? {|spec|
          begin
            return spec[:color].is_a?(AnalogColor) && spec[:quantity].is_a?(Integer)
          rescue MoMethodError
            return false
          end
        }
    )
      self.errors.add :specifics, message: "specifics must have the syntax [{color: <AnalogColor>, quantity: <Integer>},...]"
    else
      super(args)
    end
  end

  def self.create!(*args)
    if !(
        args[:specifics].length >= 2 &&
        args[:specifics].all? {|spec|
          begin
            return spec[:color].is_a?(AnalogColor) && spec[:quantity].is_a?(Integer)
          rescue MoMethodError
            return false
          end
        }
    )
      self.errors.add :specifics, message: "specifics must have the syntax [{color: <AnalogColor>, quantity: <Integer>},...]"
      raise TypeError.new "specifics must have the syntax [{color: <AnalogColor>, quantity: <Integer>},...]"
    else
      super(args)
    end
  end

  def save
    binding.pry
    if !(
        self.specifics.length >= 2 &&
        self.specifics.all? {|spec|
          begin
            return spec[:color].is_a?(AnalogColor) && spec[:quantity].is_a?(Integer)
          rescue MoMethodError
            return false
          end
        }
    )
      self.errors.add :specifics, message: "specifics must have the syntax [{color: <AnalogColor>, quantity: <Integer>},...]"
    else
      super(args)
    end
  end

  def save!
    if !(
        self.specifics.length >= 2 &&
        self.specifics.all? {|spec|
          begin
            return spec[:color].is_a?(AnalogColor) && spec[:quantity].is_a?(Integer)
          rescue MoMethodError
            return false
          end
        }
    )
      self.errors.add :specifics, message: "specifics must have the syntax [{color: <AnalogColor>, quantity: <Integer>},...]"
      raise TypeError.new "specifics must have the syntax [{color: <AnalogColor>, quantity: <Integer>},...]"
    else
      super(args)
    end
  end
end
