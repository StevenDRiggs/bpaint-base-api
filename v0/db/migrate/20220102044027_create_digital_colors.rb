class CreateDigitalColors < ActiveRecord::Migration[6.1]
  def change
    create_table :digital_colors do |t|
      t.string :name, null: false, limit: 200
      t.bigint :_integer_value, null: false

      t.timestamps
    end
  end
end
