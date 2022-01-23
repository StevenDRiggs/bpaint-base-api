class CreatePackageAnalogRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :package_analog_recipes do |t|
      t.integer :package_id, foreign_key: {to_table: :packages}, on_delete: :cascade
      t.integer :analog_recipe_id, foreign_key: {to_table: :analog_recipes}, on_delete: :cascade

      t.timestamps

      t.index [:package_id, :analog_recipe_id], unique: true
    end
  end
end
