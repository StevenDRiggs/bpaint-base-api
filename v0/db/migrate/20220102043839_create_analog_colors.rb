class CreateAnalogColors < ActiveRecord::Migration[6.1]
  def change
    create_table :analog_colors do |t|
      t.bigint :creator_id, null: false, foreign_key: {to_table: :users}
      t.string :body, null: false, default: 'heavy', limit: 50
      t.string :brandname, limit: 200
      t.integer :glossiness, null: false, default: 100
      t.string :image_url, null: false, limit: 1000
      t.integer :lightfastness, null: false, default: 1
      t.string :medium, null: false, default: 50
      t.string :name, null: false, limit: 200
      t.integer :opaqueness, null: false, default: 100
      t.string :series, limit: 200
      t.integer :thickness, null: false, default: 75
      t.integer :tinting, null: false, default: 100

      t.timestamps
    end
  end
end
