class CreatePackageRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :package_recipes do |t|
      t.references :package, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
