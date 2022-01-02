class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 50
      t.string :password_digest, null: false, limit: 300
      t.json :preferences, null: false, default: {}
      t.json :flags, null: false, default: []

      t.timestamps
    end
  end
end
