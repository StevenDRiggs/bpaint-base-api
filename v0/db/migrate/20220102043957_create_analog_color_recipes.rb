class CreateAnalogColorRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :analog_color_recipes do |t|
      t.references :analog_color, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
