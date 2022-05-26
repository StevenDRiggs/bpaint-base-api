class CreateAnalogColors < ActiveRecord::Migration[7.0]
  def change
    create_table :analog_colors do |t|
      t.string :slug, null: false, index: { unique: true }
      t.string :image_url, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :body
      t.string :brandname
      t.integer :glossiness
      t.integer :lightfastness
      t.string :medium
      t.integer :opaqueness
      t.string :series
      t.integer :thickness
      t.integer :tinting

      t.bigint :creator_id
      t.foreign_key :users, column: :creator_id, primary_key: 'id'

      t.index [:name, :body, :brandname, :glossiness, :lightfastness, :medium, :opaqueness, :series, :thickness, :tinting], unique: true, name: 'unique_analog_colors'

      t.timestamps
    end
  end
end
