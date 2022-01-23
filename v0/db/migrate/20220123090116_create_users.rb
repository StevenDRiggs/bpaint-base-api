class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 50, null: false
      t.string :password_digest, limit: 300, null: false
      t.json :preferences, null: false, default: {}
      t.json :flags, null: false, default: {}

      t.timestamps
    end
  end
end
