class CreateDigitalColors < ActiveRecord::Migration[7.0]
  def change
    create_table :digital_colors do |t|
      t.string :name, limit: 200, null: false
      t.bigint :_integer_value, null: false

      t.timestamps

      t.index :_integer_value, unique: true
    end
  end
end
