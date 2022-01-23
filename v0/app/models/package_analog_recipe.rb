class PackageAnalogRecipe < ApplicationRecord
  belongs_to :package
  belongs_to :analog_recipe
end
