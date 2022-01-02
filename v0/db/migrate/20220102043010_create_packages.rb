class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.bigint :creator_id, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
