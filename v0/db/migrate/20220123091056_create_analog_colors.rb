class CreateAnalogColors < ActiveRecord::Migration[7.0]
  def change
    create_table :analog_colors do |t|
      t.integer :creator_id, foreign_key: {to_table: :users}, on_delete: :nullify
      t.string :body, limit: 50, null: false, default: 'heavy'
      t.string :brandname, limit: 200
      t.integer :glossiness, null: false, default: 100
      t.string :image_url, limit: 1000, null: false
      t.integer :lightfastness, null: false, default: 1
      t.string :medium, limit: 50, null: false
      t.string :name, limit: 200, null: false
      t.integer :opaqueness, null: false, default: 100
      t.string :series, limit: 200
      t.integer :thickness, null: false, default: 75
      t.integer :tinting, null: false, default: 100

      t.timestamps

      t.index :image_url, unique: true
      t.index :name, unique: true
    end
  end
end
