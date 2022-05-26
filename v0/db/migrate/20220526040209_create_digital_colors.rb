class CreateDigitalColors < ActiveRecord::Migration[7.0]
  def change
    create_table :digital_colors do |t|
      t.string :name
      t.bigint :UID, null: false, index: { unique: true }

      t.bigint :creator_id
      t.foreign_key :users, column: :creator_id, primary_key: 'id'

      t.timestamps
    end
  end
end
