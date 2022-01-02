class PackageRecipe < ApplicationRecord
  belongs_to :package
  belongs_to :recipe
end
