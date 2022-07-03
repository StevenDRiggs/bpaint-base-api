class CreateAnalogRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :analog_recipes do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.json :specifics, null: false, default: [{color: nil, quantity: 1}, {color: nil, quantity: 1}]

      t.timestamps
    end
  end
end
