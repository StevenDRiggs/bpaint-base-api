class CreateAnalogColorAnalogRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :analog_color_analog_recipes do |t|
      t.integer :analog_color_id, foreign_key: {to_table: :analog_colors}, on_delete: :cascade
      t.integer :analog_recipe_id, foreign_key: {to_table: :analog_recipes}, on_delete: :cascade
      t.integer :quantity, null: false, default: 1

      t.timestamps

      t.index [:analog_color_id, :analog_recipe_id], name: 'noDupColorsInRecipe', unique: true
    end
  end
end
